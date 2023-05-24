#!/bin/bash

# Set the directory path containing the .yaml files
DIRECTORY="/Users/nguyenlam/Thesis/kubernetes-goat"

# Run kubeaudit for each .yaml file in the directory
find "$DIRECTORY" -type f -name "*.yaml" -print0 | while IFS= read -r -d '' file; do
    echo "Scanning file: $file"
    kube-score score "$file"  >> /Users/nguyenlam/Thesis/static_scan_result/kube-score
done
