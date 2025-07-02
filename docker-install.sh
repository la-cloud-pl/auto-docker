#!/bin/bash

# Skrypt stworzony do pełnej instalacji dockera na nowym systemie Debian!
 
# Log color.
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Print a log a message with timestamp.
log ()
{
    printf "${GREEN}$(date +'%m.%d.%y %H:%M:%S'): $1${NC}\n"
}

# Quit on error:
set -e
error_trap() {
    printf "${RED}Error in the init process, the instance will shut down now...${NC}" && shutdown now
}
trap error_trap ERR

root_check() {
    if [ `whoami` != 'root' ]; then
        echo "You must be root to do this, exiting ..."
        exit 1
    fi
}

update_system() {
    log "Starting Docker installation ..."
    log "Updating the system ..."
    apt-get update -y
    log "Upgrading the system ..."
    apt-get upgrade -y
    log "System updated and upgraded successfully!"
}

delete_docker() {
    log "Removing old Docker packages ..."
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
        apt-get remove -y $pkg
    done
    log "Old Docker packages removed successfully!"
}

# Add Docker's official GPG key:
docker_gpg() {
    log "Adding Docker's official GPG key ..."
    apt-get install ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
    log "Docker's official GPG key added successfully!"
}

install_docker() {
    log "Adding Docker repository to Apt sources ..."
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update

    log "Installing Docker ..."
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    log "Docker installed successfully!"
}

install_docker_compose() {
    log " Installing Docker Compose ..."
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    log "Docker and Docker Compose installed successfully!"
}

main_function() {
    root_check
    update_system
    delete_docker
    docker_gpg
    install_docker
    install_docker_compose
}

# Run the main function:
main_function