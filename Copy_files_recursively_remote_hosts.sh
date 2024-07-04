#Note : This script assume that we have remote ssh access and authorized key to access the servers.
#!/bin/bash

# Define variables
SOURCE_DIR="/path/to/source/directory"
REMOTE_USER="remote_username"
REMOTE_HOSTS=("host1.example.com" "host2.example.com" "host3.example.com")
REMOTE_DIR="/path/to/remote/directory"

# Loop through each remote host
for HOST in "${REMOTE_HOSTS[@]}"; do
    echo "Copying files to $HOST..."
    
    # Copy files recursively from local to remote directory
    scp -r "$SOURCE_DIR" "$REMOTE_USER@$HOST:$REMOTE_DIR"
    
    # Check the exit status of the scp command
    if [ $? -eq 0 ]; then
        echo "Files copied successfully to $HOST"
    else
        echo "Failed to copy files to $HOST"
    fi
done

echo "File copy process completed.

