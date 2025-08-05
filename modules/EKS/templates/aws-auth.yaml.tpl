apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
  labels:
    app.kubernetes.io/name: aws-auth
    app.kubernetes.io/part-of: eks
    app.kubernetes.io/component: worker-nodes
    app.kubernetes.io/managed-by: terraform
    app.kubernetes.io/created-by: terraform
data:
  mapRoles: |
    - rolearn: ${ng_role_arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
