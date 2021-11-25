

How to exec into ETCD
```bash
  kubectl -n external-dns exec -it  etcd-1 bash
  AUTH_OPTIONS=" --cert $ETCD_CERT_FILE --key $ETCD_KEY_FILE --cacert $ETCD_TRUSTED_CA_FILE"
  etcdctl $AUTH_OPTIONS member list
  etcdctl $AUTH_OPTIONS get / --prefix --keys-only
```

To Delete PVCs

```bash
kubectl -n external-dns delete pvc data-etcd-0 data-etcd-1 data-etcd-2
```