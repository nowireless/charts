# prometheus-hue-expoter

## Create configuration secret
1. Get the IP of the Philips Hue base station:
```bash
[~/Documents/homelab/blade-04]$ curl -s https://discovery.meethue.com/ | jq   *[cluster] 
[
  {
    "id": "ec...",
    "internalipaddress": "172.16.0.199"
  }
]
```

2. Press the button on the Philups Hue:

3. Get Philups Hue API token:
```bash
[~/Documents/homelab/blade-04]$ curl -i -k -d '{ "devicetype": "prometheus-hue-exporter" }' https://172.16.0.199/api
HTTP/2 200 
server: nginx
date: Wed, 24 Nov 2021 06:36:21 GMT
content-type: application/json
cache-control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0
pragma: no-cache
expires: Mon, 1 Aug 2011 09:00:00 GMT
access-control-max-age: 3600
access-control-allow-origin: *
access-control-allow-credentials: true
access-control-allow-methods: POST, GET, OPTIONS, PUT, DELETE, HEAD
access-control-allow-headers: Content-Type
x-xss-protection: 1; mode=block
x-frame-options: SAMEORIGIN
x-content-type-options: nosniff
content-security-policy: default-src 'self'
cache-control: no-store
pragma: no-cache
referrer-policy: no-referrer

[{"success":{"username":"PCZtdsLqGSNaPYUX7SBedriXkud322UZZk3TsJf9"}}]
```

3. Create `config.yaml` with:
```yaml
ip_address: 172.16.0.199
api_key: "PCZtdsLqGSNaPYUX7SBedriXkud322UZZk3TsJf9"
sensors:
  # With `match_names` set, the exporter will set the names of temperature
  # sensors and light level sensors to that of the motion sensor (the one that
  # you've actually configured in the Hue app)
  match_names: true
  ignore_types:
  - CLIPGenericStatus
```

4. Create credentail secret:
```bash
kubectl -n metrics create secret generic prometheus-hue-exporter-config --from-file=config.yml=config.yaml
```