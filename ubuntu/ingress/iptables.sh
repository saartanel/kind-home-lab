#!/bin/bash

# Get haproxy ingress controller loadbalancer ip
ip=$(kubectl get svc -n ingress-controller haproxy-ingress --output jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Create iptables rule to forward incoming traffic on port 80 to haproxy ingress controller
sudo iptables -I FORWARD -p tcp -d $ip --match multiport --dports 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -I PREROUTING -p tcp -i enp0s8 --dport 80 -j DNAT --to-destination $ip:80