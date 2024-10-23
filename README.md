# Bug Bounty / Vulnerability Disclosure Program Setup Script

## Overview

This bash script is designed to automate the setup of folder structures and necessary templates for Bug Bounty Programs (BBP) and Vulnerability Disclosure Programs (VDP). It ensures that the project starts with a consistent structure, including a README with relevant information and a standardized vulnerability report template.

## Features

- **Automates the creation of project folder structures**.
- **Generates README.md with program-specific details** like rules, scope, and target information.
- **Creates a vulnerability report template** for consistency in submissions.
- **Supports both Bug Bounty Programs (BBP) and Vulnerability Disclosure Programs (VDP)**.

## Requirements

- Bash shell (default on Linux and macOS).
- User must provide the program name, program type (BBP or VDP), target details, rules, and scope information.

## Usage

1. **Run the Script**: Simply execute the script in your terminal:
   ```bash
   ./easy-bounty.sh
   ```

2. **Input Information**: The script will prompt for the following details:
   - Program name (only letters, numbers, and underscores are allowed).
   - Program type: Choose between BBP (Bug Bounty Program) or VDP (Vulnerability Disclosure Program).
   - Target details: Provide target systems or applications (comma-separated).
   - Program rules: Specify rules that must be followed during the bug discovery process.
   - Scope (In Scope / Out of Scope): Define what is in and out of scope for testing.

3. **Folder Structure**:
   - For **BBP**:
     ```
     program_BBP/
     ├── findings/
     ├── reporting/
     └── README.md
     ```
   - For **VDP**:
     ```
     program_VDP/
     ├── findings/
     ├── disclosure/
     └── README.md
     ```

4. **Template Generation**:
   - Each project will include a `README.md` file with the program's details and a `report_template.md` in the appropriate folder to guide users in creating detailed vulnerability reports.

## Example

```bash
Enter the program name: MyProgram
Is this a Bug Bounty Program (BBP) or Vulnerability Disclosure Program (VDP)? BBP
Enter the details about the targets (comma-separated): example.com, api.example.com
Enter the program rules: No automated scans, no social engineering
Enter the items in scope: example.com, api.example.com
Enter the items out of scope: internal.example.com
```

## Folder Structure Created:

```
MyProgram_BBP/
├── findings/
├── reporting/
│   └── report_template.md
└── README.md
```

## Contributing

Feel free to fork this project and submit pull requests if you have improvements or additional features to suggest.

## License

This project is open-source and available under the MIT License.

This README provides a clear guide for users on what the program does, how to use it, and what to expect from the execution.