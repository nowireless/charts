#! /usr/bin/env bash

helm repo add metallb https://metallb.github.io/metallb
helm pull metallb/metallb

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm pull ingress-nginx/ingress-nginx

helm repo add jetstack https://charts.jetstack.io
helm pull jetstack/cert-manager

helm repo add bitnami https://charts.bitnami.com/bitnami
helm pull bitnami/nginx
helm pull bitnami/external-dns

helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm pull k8s-at-home/powerdns

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm pull sealed-secrets/sealed-secrets

helm repo add chartmuseum https://chartmuseum.github.io/charts

helm repo add influxdata https://helm.influxdata.com/

helm repo add kali https://kiali.org/helm-charts

helm repo add coredns https://coredns.github.io/helm
helm pull coredns/coredns

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm pull prometheus-community/kube-prometheus-stack

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm pull metrics-server/metrics-server

helm repo add deliveryhero https://charts.deliveryhero.io/
helm pull deliveryhero/node-problem-detector