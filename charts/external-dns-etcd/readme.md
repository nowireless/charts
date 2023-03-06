

How to exec into ETCD
```bash
  kubectl -n external-dns exec -it  external-dns-etcd-1 bash
  AUTH_OPTIONS=" --cert $ETCD_CERT_FILE --key $ETCD_KEY_FILE --cacert $ETCD_TRUSTED_CA_FILE"
  etcdctl $AUTH_OPTIONS member list
  etcdctl $AUTH_OPTIONS member status
  etcdctl $AUTH_OPTIONS member list | cut -c 1-50 
  etcdctl $AUTH_OPTIONS get / --prefix --keys-only
```

https://external-dns-etcd.external-dns.svc.cluster.local:2379
etcdctl $AUTH_OPTIONS --write-out=table endpoint status  --endpoints=127.0.0.1:2379

To Delete PVCs

```bash
kubectl -n external-dns delete pvc data-external-dns-etcd-{0,1,2}
```