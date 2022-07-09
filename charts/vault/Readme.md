# deploy-vault

Inspired by https://github.com/Cray-HPE/cray-vault

## Usefull commands
```bash
kubectl -n vault port-forward service/vault 8200:8200
# Vault login token for root
kubectl -n vault get secrets vault-unseal-keys -o json | jq '.data."vault-root" | @base64d' -r 
```