#!/bin/bash

declare -r RED='\033[0;31m'
declare -r GREEN='\033[0;32m'
declare -r YELLOW='\033[0;33m'
declare -r BLUE='\033[0;34m'
declare -r NC='\033[0m'

display_logo() {
    echo -e "${BLUE} ____    __    ___  _  _     ____  _____  __  __  _  _  ____  _  _ 
( ___)  /__\  / __)( \/ )___(  _ \(  _  )(  )(  )( \( )(_  _)( \/ )
 )__)  /(__)\ \__ \ \  /(___)) _ < )(_)(  )(__)(  )  (   )(   \  / 
(____)(__)(__)(___/ (__)    (____/(_____)(______)(_)\_) (__)  (__) 

        Developer: @OsmanTunahan
        GitHub: https://github.com/OsmanTunahan${NC}\n"
}

validate_program_name() {
    local program_name="$1"
    if [[ -z "$program_name" || ! "$program_name" =~ ^[a-zA-Z0-9_]+$ ]]; then
        echo -e "${RED}Error: The program name cannot be empty and must contain only letters, numbers, and underscores.${NC}"
        exit 1
    fi
}

gather_program_info() {
    read -p "Enter the program name: " program
    validate_program_name "$program"

    read -p "Is this a Bug Bounty Program (BBP) or Vulnerability Disclosure Program (VDP)? (type BBP or VDP): " program_type
    program_type=$(echo "$program_type" | tr '[:lower:]' '[:upper:]') # normalize input

    read -p "Enter the details about the targets (comma-separated): " targets_details
    read -p "Enter the program rules: " rules
    read -p "Enter the items in scope: " in_scope
    read -p "Enter the items out of scope: " out_of_scope
}

create_folder_structure() {
    local base_dir="$1"
    local readme_file="$base_dir/README.md"
    local report_template="$base_dir/report_template.md"

    mkdir -p "$base_dir/findings"
    mkdir -p "$base_dir/reporting"

    {
        echo "# Project $program ($2)"
        echo "This is a $2 project."
        echo "Ensure to follow the program's rules and policies."
        echo -e "\n## Target Details\n$targets_details"
        echo -e "\n### Program Rules:\n$rules"
        echo -e "\n### Program Scope\n#### In Scope:\n$in_scope"
        echo -e "\n#### Out of Scope:\n$out_of_scope"
    } > "$readme_file"

    {
        echo "# Report Template"
        echo "## Report Information"
        echo "- **Title:** [Vulnerability title]"
        echo "- **Description:** [Detailed description of the vulnerability]"
        echo "- **Steps to Reproduce:**"
        echo "  1. [Step 1]"
        echo "  2. [Step 2]"
        echo "  3. [Step 3]"
        echo "- **Impact:** [Description of the impact]"
        echo "- **Recommended Solution:** [Solution to mitigate the vulnerability]"
        echo "- **Attachments:** [Include relevant screenshots, logs, or other files]"
    } > "$report_template"
}

create_bbp_structure() {
    local bbp_dir="${program}_BBP"
    create_folder_structure "$bbp_dir" "Bug Bounty Program"
}

create_vdp_structure() {
    local vdp_dir="${program}_VDP"
    create_folder_structure "$vdp_dir" "Vulnerability Disclosure Program"
}

main() {
    display_logo
    gather_program_info

    case "$program_type" in
        BBP)
            create_bbp_structure
            ;;
        VDP)
            create_vdp_structure
            ;;
        *)
            echo -e "${RED}Error: Unrecognized program type. Please type 'BBP' or 'VDP'.${NC}"
            exit 1
            ;;
    esac

    echo -e "${GREEN}The folder structure for the program '$program' has been successfully created.${NC}"
}

main