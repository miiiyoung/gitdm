#!/bin/bash
echo "delete json fields"
./delete_json_fields.sh github_users.json
echo "sort json"
./sort_json.rb github_users.json
echo "unique json"
./unique_json.rb github_users.json
echo "strip json"
./strip_json.sh github_users.json stripped.json
echo "affiliated json"
ONLY_AFF=1 ./strip_json.sh github_users.json affiliated.json
cp affiliated.json ~/dev/go/src/github.com/cncf/devstats/github_users.json
echo "gen text affs files"
./gen_aff_files.sh
