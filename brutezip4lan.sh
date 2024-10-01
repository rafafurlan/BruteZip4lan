#!/bin/bash

brute_zip(){
	archive=$1
	pass=$2
	a=$(7z t $archive -p$pass 2>/dev/null | grep Everything);

	if [[ $a == *"Everything"* ]]; then
		echo "Password found: $pass"
		killall -q -9 bash
	fi
}

threads=$3
counter=0
archive=$1
wordlist=$2
echo "______            _        _______         ___ _             
| ___ \          | |      |___  (_)       /   | |            
| |_/ /_ __ _   _| |_ ___    / / _ _ __  / /| | | __ _ _ __  
| ___ \ '__| | | | __/ _ \  / / | | '_ \/ /_| | |/ _\` | \'_ \ 
| |_/ / |  | |_| | ||  __/./ /__| | |_) \___  | | (_| | | | |
\____/|_|   \__,_|\__\___|\_____/_| .__/    |_/_|\__,_|_| |_|
                                  | |                        
                                  |_|                        "
echo "By Rafael Furlan"

if [ $# -ne 3 ]; then
	echo "Usage: $0 ZIP_ARCHIVE WORDLIST.TXT NUM_THREADS"
	echo "Example: $0 example.zip /usr/share/wordlists/rockyou 10"
	exit
fi

echo ""
sleep 2
echo "Attempting to find the password... Please wait."
while read -r pass; do
	brute_zip $archive $pass &
	((counter++))

	if [ $counter -ge $threads ]; then
		wait -n
		((counter--))
	fi
done < "$wordlist"
