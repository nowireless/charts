

How to exec into ETCD
```bash
  kubectl -n external-dns exec -it  external-dns-etcd-1 bash
  AUTH_OPTIONS=" --cert $ETCD_CERT_FILE --key $ETCD_KEY_FILE --cacert $ETCD_TRUSTED_CA_FILE"
  etcdctl $AUTH_OPTIONS member list
  etcdctl $AUTH_OPTIONS get / --prefix --keys-only
```

To Delete PVCs

```bash
ubectl -n external-dns delete pod external-dns-etcd-{0,1,2}```