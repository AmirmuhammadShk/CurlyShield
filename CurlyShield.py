import os
import shutil
import pandas as pd
import subprocess
import sys

# Configurations
if len(sys.argv) < 5:
    print("Usage: python CurlyShield.py <directory_name> <goal_server> <user> <path_to_deploy>")
    sys.exit(1)

BASE_DIR = sys.argv[1]  # Directory passed as argument
GOAL_SERVER = sys.argv[2]  # Goal server passed as argument
USER = sys.argv[3]  # User for the server
PATH_TO_DEPLOY = sys.argv[4]  # Path to deploy on the server

EXCEL_FILE = os.path.join(BASE_DIR, f"{os.path.basename(BASE_DIR)}.xlsx")  # Path to the Excel file named same as directory
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")  # Directory where the scripts are stored
DEPLOY_DIR = os.path.join(BASE_DIR, "Deploy")  # Directory to create and copy scripts

# Step 1: Create Deploy Directory
if not os.path.exists(DEPLOY_DIR):
    os.makedirs(DEPLOY_DIR)

# Step 2: Read Excel File
data = pd.read_excel(EXCEL_FILE)

# Step 3: Iterate through rows and process scripts
for index, row in data.iterrows():
    recommendation = row.get("recommendations")
    deploy_flag = row.get("Deploy")
    print(deploy_flag)

    if '1.0' in str(deploy_flag):
        script_path = os.path.join(SCRIPTS_DIR, recommendation)
        if os.path.exists(script_path):
            shutil.copy(script_path, DEPLOY_DIR)
        else:
            print(f"Script {recommendation} not found in {SCRIPTS_DIR}.")

# Step 4: Copy Deploy Directory to Goal Linux Server using scp
try:
    subprocess.run([
        "scp", "-r", DEPLOY_DIR, f"{USER}@{GOAL_SERVER}:{PATH_TO_DEPLOY}"
    ], check=True)
except subprocess.CalledProcessError as e:
    print(f"Error copying files to server: {e}")

# Step 5: Run all scripts on the Goal Server
try:
    command = f"ssh {USER}@{GOAL_SERVER} 'cd {PATH_TO_DEPLOY} && for file in *.sh; do bash \"$file\"; done'"
    print(command)
    subprocess.run(command, shell=True, check=True)
except subprocess.CalledProcessError as e:
    print(f"Error running scripts on server: {e}")

print("Deployment process completed.")
