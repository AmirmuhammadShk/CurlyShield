# CurlyShield

Automating CIS Compliance with Precision and Ease
Overview

CurlyShield is a tool designed for security specialists aiming to streamline the process of system hardening according to CIS Benchmarks. It bridges the gap between complex benchmark documentation and practical implementation by converting CIS Benchmark PDFs into actionable resources like Excel sheets and executable scripts.
Features

    CIS Benchmark Conversion:
    Converts detailed CIS Benchmark PDFs into easy-to-read Excel files for clear documentation and tracking.

    Executable Hardening Scripts:
    Automatically generates and rewrites Bash scripts to simplify and accelerate the hardening process.

    Automated Deployment:
    Ready-to-use scripts ensure seamless application of CIS compliance across multiple environments.

    Customizable Outputs:
    Tailor the generated scripts to fit specific system configurations and security needs.

# Who Is It For?

CurlyShield is perfect for:

    Security Specialists: Streamline the process of applying CIS Benchmarks to your systems.
    DevOps Engineers: Automate compliance and integrate hardening scripts into your CI/CD pipelines.
    System Administrators: Gain better control and visibility over your system’s security posture.

# How It Works

    Fetch and Parse:
        CurlyShield processes official CIS Benchmark PDFs to extract relevant hardening guidelines.

    Excel Conversion:
        The parsed benchmarks are structured into a user-friendly Excel file, providing a clear overview of compliance steps.

    Script Generation:
        Bash scripts are automatically created based on benchmark requirements, enabling rapid deployment.

    Execution:
        Run the generated scripts on your target systems for automated hardening.
# Usage
1. Clone the Repository

    git clone https://github.com/yourusername/CurlyShield.git
    cd CurlyShield

2. Configure Deployment

    Open the Excel file generated by CurlyShield.
    Set the Deploy column to TRUE for each row (benchmark) you want to deploy.

3. Set Up the Environment

    Create a Python Virtual Environment:

        python -m venv venv

    Activate the Virtual Environment:

   Linux/Mac/BSD:

        source venv/bin/activate

    Windows:

        venv\Scripts\activate.bat

4. Install Dependencies

        pip install pandas openpyxl

5. Execute CurlyShield

    Run the script with the required arguments:
    
        python CurlyShield.py <directory_name> <goal_server> <user> <path_to_deploy>

   directory_name : Directory containing the CIS Benchmarks and configuration files
   
   goal_server : The server you want to harden (e.g., hostname or IP)
   
   user : User with deployment permissions
   
   path_to_deploy : The target path for deploying scripts
   
# Why CurlyShield?

    Save time by automating tedious manual compliance tasks.
    Ensure consistent application of CIS Benchmarks across environments.
    Enhance security visibility with well-structured Excel documentation.

# Contributions

We welcome contributions! Feel free to submit issues, suggest features, or fork the repository for your needs.


Secure your systems effortlessly with CurlyShield. ✨
