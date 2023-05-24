#!/bin/bash

# Define the path to the file containing the result
result_file="/Users/nguyenlam/Thesis/static_scan_result/checkov"

# Read the result from the file
result=$(cat "$result_file")

# Count the occurrences of CRITICAL and WARNING
critical_count=$(grep -o -i "PASSED" <<< "$result" | wc -l)
warning_count=$(grep -o -i "FAILED" <<< "$result" | wc -l)

# Print the counts
echo "PASSED count: $critical_count"
echo "FAILED count: $warning_count"
