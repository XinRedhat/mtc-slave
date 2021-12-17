#!/bin/bash

# set -ex

set -o errexit    # exit when a command fails
set -o nounset    # error when an undefined variable is referenced
set -o pipefail   # error if the input command to a pipe fails

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly TERRAFORM_DIR=$SCRIPT_DIR/terraform

if [ "$#" -ne 3 ]; then
    echo "Usage: ./slave.sh <username>  <password>  <ssh_key path>"
    exit -1
fi

username=$1
password=$2
key_path=$3

terraform -chdir=$TERRAFORM_DIR init
terraform -chdir=$TERRAFORM_DIR apply -var user_name=$username -var password=$password -var ssh_key=$key_path -auto-approve