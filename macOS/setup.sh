#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST_DIR="${SCRIPT_DIR}/manifests"
CATEGORY_TSV="${MANIFEST_DIR}/categories.tsv"
PROFILE_DIR="${MANIFEST_DIR}/profiles"

DEFAULT_PROFILE="standard"

SILENT_MODE=false
DRY_RUN=false
LIST_CATEGORIES=false
PROFILE="${DEFAULT_PROFILE}"
PROFILE_EXPLICIT=false
CATEGORIES_CSV=""

declare -a CAT_IDS=()
declare -a CAT_NAMES=()
declare -a CAT_FILES=()
declare -a CAT_DESCS=()
declare -a SELECTED_IDS=()
declare -a TMP_FILES=()

cleanup_tmp_files() {
    if [[ ${#TMP_FILES[@]} -gt 0 ]]; then
        rm -f "${TMP_FILES[@]}" 2>/dev/null || true
    fi
}
trap cleanup_tmp_files EXIT

log() {
    printf '[setup] %s\n' "$*"
}

die() {
    printf '[setup] ERROR: %s\n' "$*" >&2
    exit 1
}

usage() {
    cat <<'EOF'
Usage: ./setup.sh [options]

Options:
  --silent                       Run without interactive prompts.
  --profile minimal|standard|full
                                 Select profile (default: standard).
  --categories a,b,c             Select categories directly.
  --list-categories              Show categories and profile mappings.
  --dry-run                      Print plan only (no installation).
  --help                         Show this help message.
EOF
}

is_tty() {
    [[ -t 0 && -t 1 ]]
}

trim() {
    local value="$1"
    value="${value#"${value%%[![:space:]]*}"}"
    value="${value%"${value##*[![:space:]]}"}"
    printf '%s' "$value"
}

category_exists() {
    local target="$1"
    local id
    for id in "${CAT_IDS[@]}"; do
        if [[ "$id" == "$target" ]]; then
            return 0
        fi
    done
    return 1
}

profile_exists() {
    local profile_name="$1"
    [[ -f "${PROFILE_DIR}/${profile_name}.txt" ]]
}

add_unique_selected() {
    local candidate="$1"
    local id
    for id in "${SELECTED_IDS[@]}"; do
        if [[ "$id" == "$candidate" ]]; then
            return 0
        fi
    done
    SELECTED_IDS+=("$candidate")
}

load_categories() {
    [[ -f "$CATEGORY_TSV" ]] || die "categories.tsv not found: ${CATEGORY_TSV}"

    local line_id line_name line_file line_desc
    while IFS=$'\t' read -r line_id line_name line_file line_desc || [[ -n "${line_id:-}" ]]; do
        line_id="$(trim "${line_id:-}")"
        [[ -z "$line_id" ]] && continue
        [[ "$line_id" == \#* ]] && continue

        line_name="$(trim "${line_name:-}")"
        line_file="$(trim "${line_file:-}")"
        line_desc="$(trim "${line_desc:-}")"

        [[ -n "$line_name" ]] || die "invalid categories.tsv row (empty display name): ${line_id}"
        [[ -n "$line_file" ]] || die "invalid categories.tsv row (empty fragment path): ${line_id}"

        CAT_IDS+=("$line_id")
        CAT_NAMES+=("$line_name")
        CAT_FILES+=("$line_file")
        CAT_DESCS+=("$line_desc")
    done < "$CATEGORY_TSV"

    [[ ${#CAT_IDS[@]} -gt 0 ]] || die "no categories loaded from ${CATEGORY_TSV}"
}

get_category_index() {
    local target="$1"
    local i
    for ((i = 0; i < ${#CAT_IDS[@]}; i++)); do
        if [[ "${CAT_IDS[$i]}" == "$target" ]]; then
            printf '%s' "$i"
            return 0
        fi
    done
    return 1
}

get_category_name() {
    local target="$1"
    local idx
    idx="$(get_category_index "$target")" || return 1
    printf '%s' "${CAT_NAMES[$idx]}"
}

get_category_fragment_path() {
    local target="$1"
    local idx
    idx="$(get_category_index "$target")" || return 1
    printf '%s/%s' "$SCRIPT_DIR" "${CAT_FILES[$idx]}"
}

load_profile_categories() {
    local profile_name="$1"
    local profile_file="${PROFILE_DIR}/${profile_name}.txt"
    [[ -f "$profile_file" ]] || die "profile not found: ${profile_name}"

    SELECTED_IDS=()

    local line
    while IFS= read -r line || [[ -n "$line" ]]; do
        line="$(trim "$line")"
        [[ -z "$line" ]] && continue
        [[ "$line" == \#* ]] && continue
        category_exists "$line" || die "unknown category in profile (${profile_name}): ${line}"
        add_unique_selected "$line"
    done < "$profile_file"

    [[ ${#SELECTED_IDS[@]} -gt 0 ]] || die "profile has no categories: ${profile_name}"
}

parse_categories_csv() {
    local csv="$1"
    SELECTED_IDS=()

    local -a requested=()
    local value
    IFS=',' read -r -a requested <<< "$csv"

    for value in "${requested[@]}"; do
        value="$(trim "$value")"
        [[ -z "$value" ]] && continue
        category_exists "$value" || die "unknown category: ${value}"
        add_unique_selected "$value"
    done

    [[ ${#SELECTED_IDS[@]} -gt 0 ]] || die "no valid categories selected from --categories"
}

print_categories_and_profiles() {
    local i
    echo "Available categories:"
    for ((i = 0; i < ${#CAT_IDS[@]}; i++)); do
        printf '  - %-18s (%s)\n' "${CAT_IDS[$i]}" "${CAT_NAMES[$i]}"
        printf '      file: %s\n' "${CAT_FILES[$i]}"
        printf '      desc: %s\n' "${CAT_DESCS[$i]}"
    done
    echo

    echo "Profiles:"
    local profile_name profile_file profile_line
    for profile_name in minimal standard full; do
        profile_file="${PROFILE_DIR}/${profile_name}.txt"
        printf '  - %s:\n' "$profile_name"
        [[ -f "$profile_file" ]] || continue
        while IFS= read -r profile_line || [[ -n "$profile_line" ]]; do
            profile_line="$(trim "$profile_line")"
            [[ -z "$profile_line" ]] && continue
            [[ "$profile_line" == \#* ]] && continue
            printf '      - %s\n' "$profile_line"
        done < "$profile_file"
    done
}

run_tui_selector() {
    local -a selected=()
    local i
    for ((i = 0; i < ${#CAT_IDS[@]}; i++)); do
        selected[i]=0
    done

    local preset idx
    for preset in "${SELECTED_IDS[@]}"; do
        idx="$(get_category_index "$preset")" || continue
        selected[idx]=1
    done

    local cursor=0
    local key rest

    while true; do
        printf '\033[2J\033[H'
        echo "macOS Setup - Category Selector"
        echo "Use ↑/↓ to move, SPACE to toggle, ENTER to submit, a to toggle all, q to quit."
        echo

        for ((i = 0; i < ${#CAT_IDS[@]}; i++)); do
            local pointer=' '
            local mark=' '
            [[ $i -eq $cursor ]] && pointer='>'
            [[ "${selected[$i]}" -eq 1 ]] && mark='x'
            printf '%s [%s] %-18s %s\n' "$pointer" "$mark" "${CAT_IDS[$i]}" "${CAT_DESCS[$i]}"
        done

        IFS= read -rsn1 key
        if [[ "$key" == $'\x1b' ]]; then
            IFS= read -rsn2 rest || true
            key+="$rest"
        fi

        case "$key" in
            $'\x1b[A')
                ((cursor--))
                if ((cursor < 0)); then
                    cursor=$((${#CAT_IDS[@]} - 1))
                fi
                ;;
            $'\x1b[B')
                ((cursor++))
                if ((cursor >= ${#CAT_IDS[@]})); then
                    cursor=0
                fi
                ;;
            " ")
                if [[ "${selected[$cursor]}" -eq 1 ]]; then
                    selected[cursor]=0
                else
                    selected[cursor]=1
                fi
                ;;
            [aA])
                local all_selected=1
                for ((i = 0; i < ${#selected[@]}; i++)); do
                    if [[ "${selected[$i]}" -eq 0 ]]; then
                        all_selected=0
                        break
                    fi
                done
                if [[ $all_selected -eq 1 ]]; then
                    for ((i = 0; i < ${#selected[@]}; i++)); do
                        selected[i]=0
                    done
                else
                    for ((i = 0; i < ${#selected[@]}; i++)); do
                        selected[i]=1
                    done
                fi
                ;;
            "")
                SELECTED_IDS=()
                for ((i = 0; i < ${#CAT_IDS[@]}; i++)); do
                    if [[ "${selected[$i]}" -eq 1 ]]; then
                        SELECTED_IDS+=("${CAT_IDS[$i]}")
                    fi
                done

                if [[ ${#SELECTED_IDS[@]} -eq 0 ]]; then
                    echo
                    echo "At least one category must be selected."
                    sleep 1
                else
                    printf '\033[2J\033[H'
                    return 0
                fi
                ;;
            [qQ])
                printf '\033[2J\033[H'
                die "selection cancelled by user"
                ;;
        esac
    done
}

build_combined_brewfile() {
    local raw_file dedup_file selected_id fragment
    raw_file="$(mktemp "/tmp/macos-setup-raw.XXXXXX")"
    dedup_file="$(mktemp "/tmp/macos-setup-dedup.XXXXXX")"
    TMP_FILES+=("$raw_file" "$dedup_file")

    {
        echo "# Generated by macOS/setup.sh"
        echo "# Selected categories: ${SELECTED_IDS[*]}"
        echo
    } > "$raw_file"

    for selected_id in "${SELECTED_IDS[@]}"; do
        fragment="$(get_category_fragment_path "$selected_id")" || die "category not found: ${selected_id}"
        [[ -f "$fragment" ]] || die "fragment not found: ${fragment}"
        {
            echo
            echo "# --- ${selected_id} ---"
            cat "$fragment"
            echo
        } >> "$raw_file"
    done

    awk '!seen[$0]++' "$raw_file" > "$dedup_file"
    printf '%s' "$dedup_file"
}

print_execution_plan() {
    local brewfile_path="$1"
    local id name
    echo "Selected categories:"
    for id in "${SELECTED_IDS[@]}"; do
        name="$(get_category_name "$id" || printf '%s' "$id")"
        printf '  - %s (%s)\n' "$id" "$name"
    done
    echo
    echo "Combined Brewfile: ${brewfile_path}"
}

ensure_homebrew() {
    if ! command -v brew >/dev/null 2>&1; then
        log "Homebrew is not installed. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    local brew_bin shell_line zprofile_file
    brew_bin="$(command -v brew)"
    eval "$("$brew_bin" shellenv)"

    zprofile_file="${HOME}/.zprofile"
    shell_line="eval \"\$(${brew_bin} shellenv)\""
    touch "$zprofile_file"
    if ! grep -Fqx "$shell_line" "$zprofile_file"; then
        echo "$shell_line" >> "$zprofile_file"
    fi
}

apply_post_install_tweaks() {
    local brew_prefix brew_bash
    brew_prefix="$(brew --prefix)"

    if [[ -x "${brew_prefix}/bin/gsha256sum" && ! -e "${brew_prefix}/bin/sha256sum" ]]; then
        ln -s "${brew_prefix}/bin/gsha256sum" "${brew_prefix}/bin/sha256sum" 2>/dev/null || true
    fi

    brew_bash="${brew_prefix}/bin/bash"
    if [[ -f "$brew_bash" ]]; then
        if ! grep -Fqx "$brew_bash" /etc/shells; then
            if ! echo "$brew_bash" | sudo tee -a /etc/shells >/dev/null; then
                log "Could not append ${brew_bash} to /etc/shells. Skipping shell registration."
                return 0
            fi
        fi

        if [[ "${SHELL:-}" != "$brew_bash" ]]; then
            if ! chsh -s "$brew_bash"; then
                log "Could not change default shell to ${brew_bash}. Skipping shell switch."
            fi
        fi
    fi
}

run_install() {
    local brewfile_path="$1"

    ensure_homebrew
    log "Updating Homebrew..."
    brew update
    brew upgrade

    log "Installing packages with brew bundle..."
    brew bundle --file "$brewfile_path"

    log "Applying post-install tweaks..."
    apply_post_install_tweaks

    log "Cleaning up Homebrew cache..."
    brew cleanup

    log "Setup complete. Please restart your terminal session."
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --silent)
                SILENT_MODE=true
                ;;
            --dry-run)
                DRY_RUN=true
                ;;
            --list-categories)
                LIST_CATEGORIES=true
                ;;
            --profile)
                shift || die "--profile requires a value"
                PROFILE="$(trim "$1")"
                PROFILE_EXPLICIT=true
                ;;
            --categories)
                shift || die "--categories requires a value"
                CATEGORIES_CSV="$(trim "$1")"
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            *)
                die "unknown option: $1"
                ;;
        esac
        shift
    done
}

main() {
    parse_args "$@"
    load_categories

    if [[ "$LIST_CATEGORIES" == true ]]; then
        print_categories_and_profiles
        exit 0
    fi

    profile_exists "$PROFILE" || die "unknown profile: ${PROFILE}"

    if [[ -n "$CATEGORIES_CSV" ]]; then
        parse_categories_csv "$CATEGORIES_CSV"
    else
        load_profile_categories "$PROFILE"

        if [[ "$SILENT_MODE" == false ]] && is_tty && [[ "$PROFILE_EXPLICIT" == false ]]; then
            run_tui_selector
        fi
    fi

    local combined_brewfile
    combined_brewfile="$(build_combined_brewfile)"
    print_execution_plan "$combined_brewfile"

    if [[ "$DRY_RUN" == true ]]; then
        echo
        echo "--- dry-run: combined Brewfile preview ---"
        cat "$combined_brewfile"
        exit 0
    fi

    run_install "$combined_brewfile"
}

main "$@"
