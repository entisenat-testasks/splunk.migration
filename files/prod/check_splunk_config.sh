#!/bin/bash

# Splunk configuration files
SPLUNK_HOME="/opt/splunk"
SERVER_CONF="${SPLUNK_HOME}/etc/system/local/server.conf"
INPUTS_CONF="${SPLUNK_HOME}/etc/system/local/inputs.conf"

# Desired configurations
DESIRED_SERVER_CONF=".\server.conf"
DESIRED_INPUTS_CONF=".\inputs.conf"

# Compare the current server.conf with the desired configuration
if ! cmp -s "${SERVER_CONF}" "${DESIRED_SERVER_CONF}"; then
    echo "server.conf is not in the desired state. Updating..."

    # Replace the current server.conf with the desired one
    cp -f "${DESIRED_SERVER_CONF}" "${SERVER_CONF}"

    # Restart Splunk to apply the changes (adjust this as needed)
    "${SPLUNK_HOME}/bin/splunk" restart
fi

# Compare the current inputs.conf with the desired configuration
if ! cmp -s "${INPUTS_CONF}" "${DESIRED_INPUTS_CONF}"; then
    echo "inputs.conf is not in the desired state. Updating..."

    # Replace the current inputs.conf with the desired one
    cp -f "${DESIRED_INPUTS_CONF}" "${INPUTS_CONF}"

    # Restart Splunk to apply the changes (adjust this as needed)
    "${SPLUNK_HOME}/bin/splunk" restart
fi

echo "Splunk configuration is in the desired state."
exit 0