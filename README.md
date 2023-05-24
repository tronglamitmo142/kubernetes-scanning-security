
`eksctl create cluster --name k8s-goat-cluster --region us-west-1 --node-type t3.small --nodes 2`

`aws eks update-kubeconfig --name k8s-goat-cluster --region us-west-1 `

`cd kubernetes-goat/`

`bash setup-kubernetes-goat.sh`

# Static scan 
- kube-score:
  - type of issue 
  - list of recommendation
- Checkov: 