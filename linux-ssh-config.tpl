cat <<EOF >> ~/.ssh/config

Host ${hostname}
    hostname ${hostnameP}
    User ${user}
    Identityfile ${identitiyfile}
EOF

