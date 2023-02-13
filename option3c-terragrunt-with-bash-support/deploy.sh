#!/bin/sh
set -e

# Usage:
#   ./deploy.sh {COMMAND} {ENV} {REGION}
#
# Example:
#   ./deploy.sh plan dev us-east-1


run_terragrunt(){
  case $1 in
    apply)
      case $2 in
        dev|dr|prod|test|uat)
          terragrunt init
          terragrunt apply;;
        *)
          echo "Please use one of [dev/dr/prod/test/uat] for env"
          exit 1 ;;
      esac ;;
    plan)
      case $2 in
        dev|dr|prod|test|uat)
          terragrunt init
          terragrunt plan;;
        *)
          echo "Please use one of [dev/dr/prod/test/uat] for env"
          exit 1 ;;
      esac ;;
    destroy)
      case $2 in
        dev|dr|prod|test|uat)
          terragrunt init
          terragrunt destroy;;
        *)
          echo "Please use one of [dev/dr/prod/test/uat] for env"
          exit 1 ;;
      esac ;;
    *)
      echo "Please use one of [apply/plan/destroy] as a command to the deploy script"
      exit 1 ;;
  esac
}

command=$1
env=$2
region=$3

if [ -z "${command}" ]; then
  echo "Please pass a command to terraform [apply/plan/destroy]"
  exit 1
fi

if [ -z "${env}" ]; then
  echo "Please pass an env to the deploy script [dev/dr/test/uat/prod]"
  exit 1
fi

if [ -z "${region}" ]; then
  echo "Please pass an aws region to the deploy script"
  exit 1
fi


export TF_WORKSPACE=$env
echo "Initialising Terragrunt"
run_terragrunt "$command" "$TF_WORKSPACE" "$region"
