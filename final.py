import os
import subprocess

# Set the path to your Terraform module directory
MODULE_DIR = "/path/to/my-vm-module"

# Set the AWS region to use
AWS_REGION = "us-west-2"

# Set the input variables for the Terraform module
TF_VARS = {
    "instance_count": 2,
    "instance_type": "t3.micro",
    "ami_id": "ami-0c94855ba95c71c99",
}

# Change to the Terraform module directory
os.chdir(MODULE_DIR)

# Initialize the Terraform working directory
subprocess.run(["terraform", "init"])

# Set the Terraform AWS provider region
subprocess.run(["terraform", "apply", "-var", f"region={AWS_REGION}"])

# Apply the Terraform module
for key, value in TF_VARS.items():
    subprocess.run(["terraform", "apply", "-var", f"{key}={value}"])
