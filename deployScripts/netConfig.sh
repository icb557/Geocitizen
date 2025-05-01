#!/bin/bash
#Used to work with virtualbox
#Needs to be executed by root

#Config network interfaces
sudo cat ./auxFiles/netConfig.yaml > /etc/netplan/00-installer-config.yaml
sudo netplan apply
echo "Network interfaces configured succesfully"

#Domain name creation
new_line="172.16.0.11 geocitizen.com"
hosts_file="/etc/hosts"
tmp_file=$(mktemp)
last_ipv4_line=0
line_number=0

while IFS= read -r line; do
    ((line_number++))
    echo "$line" >> "$tmp_file"
    # Check if the line starts with an IPv4 address
    if [[ $line =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]; then
        last_ipv4_line=$line_number
    fi
done < "$hosts_file"

awk -v insert_line="$new_line" -v insert_after="$last_ipv4_line" '{
    print
    if (NR == insert_after) {
        print insert_line
    }
}' "$tmp_file" > "${tmp_file}.new"

sudo cp "${tmp_file}.new" "$hosts_file"

rm "$tmp_file" "${tmp_file}.new"

echo "Domain name created successfully."
