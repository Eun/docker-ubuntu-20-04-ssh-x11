#!/bin/sh

TEXT="\e[0;1;37;45m\e[K"
CMD="\e[4m"
HOSTNAME=$(hostname -i)

if [ -z "$RUN_USER" ]; then
    RUN_USER="root"
fi

printf ${TEXT}
printf "  Welcome! To connect use\n"
printf "\n"
printf "    ${CMD}ssh -X ${RUN_USER}@${HOSTNAME}${TEXT}\n"
printf "  OR\n"
printf "    ${CMD}ssh -X -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ${RUN_USER}@${HOSTNAME}${TEXT}\n"
printf "\n"
printf "\e[0m\n"

stop() {
    exit 0
}

trap 'stop' 1 # SIGHUP
trap 'stop' 2 # SIGINT
trap 'stop' 3 # SIGQUIT
trap 'stop' 6 # SIGABRT
trap 'stop' 15 # SIGTERM


$@