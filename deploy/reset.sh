#/bin/bash
kubectl delete -f free5gc-amf.yaml
kubectl delete -f free5gc-smf.yaml
kubectl delete -f free5gc-upf.yaml
kubectl delete -f nextepc-pcrf.yaml
kubectl delete -f nextepc-hss.yaml
kubectl create -f nextepc-hss.yaml
kubectl create -f nextepc-pcrf.yaml
kubectl create -f free5gc-amf.yaml
kubectl create -f free5gc-smf.yaml
kubectl create -f free5gc-upf.yaml

