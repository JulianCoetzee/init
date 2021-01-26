#!/bin/bash

userinput=$1
# the username to delete

online="$(who | awk '{print $1}' | grep -o ^"$userinput"$)"
# Check for wether the user is ACTIVE/online

# To delete any non-system user:
# online="$(grep -o ^"$userinput" /etc/passwd)"

if [ id | grep root 1>/dev/null 2>&1 != 0 ]
# ^Check for root user/admin priviledges
then
	echo "Error: Script requires root priviledges."
	exit 1
fi

if [ "$userinput" = "$online" ]
then
	killall -u "$userinput"
    # kill processes involving user
	deluser --remove-home "$userinput"
	echo "\"$userinput\" logged out and deleted."
else
	echo "\"$userinput\" is not logged in."
fi