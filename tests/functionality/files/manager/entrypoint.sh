#!/usr/bin/bash
echo "Waiting for success scripts to exist";
for node in ipa-server ipa-client8 ipa-client-9; do
    for script in post pre; do
        FILENAME="/return/${node}.${script}";
        echo "Waiting for '${FILENAME}' to appear";
        while [ ! -f "${FILENAME}" ]; do
            sleep 1;
        done;
        echo "Checking if '${script}' script triggered for node '${node}'";
        grep 'success' "${FILENAME}";
    done;
done;

exit 0;
