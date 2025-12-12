#!/bin/bash

cat /etc/hosts | while read -r ip host oth; do
    [[ -z "$ip" || "$ip" == \#* ]] && continue
    lookup=$(nslookup "$host" 2>dev>null | grep "Adress: " | tail -n 1 | awk '{print $2}')
    [[ -z "$lookup" ]] && continue
    if [[ "$lookup" != "$ip" ]]; then
        echo "$lookup vs $ip"
        echo "Bogus IP for <$host> in /etc/hosts!"
    fi
done