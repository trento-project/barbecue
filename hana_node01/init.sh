#!/bin/bash

set -m

# Start the first process
/usr/bin/soappatrol /tmp/.sapstream50013 /etc/soappatrol.toml &

# Start the second process
/usr/bin/trento-agent start &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
