#!/bin/bash

# Define the path to the file containing the result
result_file="/Users/nguyenlam/Thesis/static_scan_result/kube-score"

# Read the result from the file
result=$(cat "$result_file")

# Count the occurrences of CRITICAL and WARNING
critical_count=$(grep -o -i "CRITICAL" <<< "$result" | wc -l)
warning_count=$(grep -o -i "WARNING" <<< "$result" | wc -l)

# Print the counts
echo "CRITICAL count: $critical_count"
echo "WARNING count: $warning_count"
