#!/bin/bash
directory= "/path/to/cleanup"
find "$directory" -type f -mtime +7 -exec rm {} \;
echo "Old files removed."