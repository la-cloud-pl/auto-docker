#!/bin/bash

# ---------------------------
# Initiation script for the auto-docker project using a GitHub release.
# Please run this script as root.
# ---------------------------

# Colors & Logging:
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log () {
    printf "${GREEN}$(date +'%m.%d.%y %H:%M:%S'): $1${NC}\n"
}

# Error Handling:
set -e
error_trap() {
    printf "\n${RED}Error in the init process, the instance will shut down now...${NC}\n"
}
trap error_trap ERR

# Config:
REPO_USER="la-cloud-pl"
REPO_NAME="auto-docker"
RELEASE_TAG="v1.0.0"
INSTALL_DIR="$HOME/${REPO_NAME}"
INSTALL_SCRIPT="src/docker-install.sh"  # Relative to repo root

# Run as root check:
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}❌ This script must be run as root. Exiting.${NC}"
  exit 1
fi

# Main function - Download and Extract Release:
main() {
    log "Downloading release ${RELEASE_TAG} of ${REPO_NAME}..."

    TMP_DIR=$(mktemp -d)
    ZIP_URL="https://github.com/${REPO_USER}/${REPO_NAME}/archive/refs/tags/${RELEASE_TAG}.zip"

    curl -L -s "$ZIP_URL" -o "$TMP_DIR/repo.zip"

    log "Extracting archive..."
    unzip -q "$TMP_DIR/repo.zip" -d "$TMP_DIR"

    EXTRACTED_DIR="${TMP_DIR}/${REPO_NAME}-${RELEASE_TAG}"

    log "Installing to ${INSTALL_DIR}..."
    rm -rf "$INSTALL_DIR"
    mv "$EXTRACTED_DIR" "$INSTALL_DIR"

    # Set Permissions and Run Installer:
    log "Setting executable permissions for ${INSTALL_SCRIPT}..."
    chmod +x "${INSTALL_DIR}/${INSTALL_SCRIPT}"

    log "Running docker installer script..."
    bash "${INSTALL_DIR}/${INSTALL_SCRIPT}"

    log "✅ Installation complete!"
}

# Running the main function:
main