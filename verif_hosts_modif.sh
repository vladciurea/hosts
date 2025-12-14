#!/bin/bash

host=$1
ip=$2
dns=$3
lookup=$(dig +short @"$dns" "$host" | head -n 1)
if [ "$lookup" != "$ip" ];then
    echo "$lookup vs $ip"
    echo "Bogus IP for <$host>!"
fi