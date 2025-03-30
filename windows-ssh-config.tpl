add-content -path c:/users/osiris/.ssh/config -value @'
Host ${hostname}
    hostname ${hostname}
    User ${user}
    Identityfile ${identityfile}
'@