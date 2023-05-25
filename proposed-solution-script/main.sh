#!/bin/bash

DIRECTORY="../kubernetes-goat"
# Phase 1: Analysis scanning
run_misconfigratuion_scanning() {
    echo "Running Missconfiguration scanning..."
    find "$DIRECTORY" -type f -name "*.yaml" -print0 | while IFS= read -r -d '' file; do
        echo "Scanning file: $file"
        kube-score score "$file"  >> misconfiguration-scanning-result
    done
    echo ""
}
run_docker_scanning() {
    echo "Running Dockerfile scanning..."
    find "$DIRECTORY" -type f -name "Dockerfile" -print0 | while IFS= read -r -d '' file; do
        echo "Scanning file: $file"
        hadolint "$file" >> Dockerfile-scanning-result
    done
}
# Phase 2: Dynamic scanning 
run_dynamic_scanning() {
    cd ../kube-hunter 
    echo "Running Dynamic scanning..."
    kubectl apply -f ../kube-hunter/job.yaml 
    pod_name=$(kubectl get pods -l app=kube-hunter --output=jsonpath='{.items[0].metadata.name}')
    kubectl wait --for=condition=complete pod ${pod_name} --timeout=300s 
    kubectl logs $pod_name > dynamic-scanning-result
}

# Phase 3: Compliance Analysis and OPA scanning
run_software_compliance_analysis_and_OPA () {
    dependency-check --out . --scan ../kubernetes-goat
}
main() {
    run_misconfigratuion_scanning
    run_docker_scanning
    run_dynamic_scanning
}

main