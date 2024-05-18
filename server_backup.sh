#!/bin/bash
source_dir="/home/user/documents"
remote_server="user@192.168.1.100:/backup"
rsync -avz "$source_dir" "$remote_server"
echo "Files backed up to remote server."
