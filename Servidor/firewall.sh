#!/bin/bash

echo "1" > /proc/sys/net/ipv4/ip_forward


## FLUSH de reglas

iptables --flush && echo "regla 1 ok"
iptables --table nat --flush && echo "regla 2 ok"
iptables -Z
iptables --delete-chain && echo "regla 3 ok"
iptables --table nat --delete-chain && echo "regla 4 ok"

## Establecemos politica por defecto
#echo -n politicas por defecto

iptables -A INPUT -i lo -j ACCEPT && echo "regla 10 ok"
iptables -I OUTPUT -p tcp -j ACCEPT
iptables -I OUTPUT -p udp -j ACCEPT

# Abrimos el puerto del servidor DNS
iptables -A INPUT -i eth0 -s 0/0 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -s 0/0 -p udp --dport 53 -j ACCEPT


# your proxy IP
SQUIDIP=10.40.2.254

# your proxy listening port
SQUIDPORT=3127
SQUIDPORT2=3129


#iptables -t nat -A PREROUTING -s $SQUIDIP -p tcp --dport 80 -j ACCEPT
#iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $SQUIDIP:$SQUIDPORT
#iptables -t nat -A POSTROUTING -j MASQUERADE
#iptables -t mangle -A PREROUTING -p tcp --dport $SQUIDPORT -j DROP

iptables -t nat -A PREROUTING -s $SQUIDIP -p tcp --dport 443 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination $SQUIDIP:$SQUIDPORT2
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t mangle -A PREROUTING -p tcp --dport $SQUIDPORT2 -j DROP


###BLOQUEAR WHATSAPP
###https://www.whatsapp.com/cidr.txt
iptables -A FORWARD -p tcp --dport xmpp-client -j DROP
ip6tables -A FORWARD -p tcp --dport xmpp-client -j DROP
iptables -A FORWARD -p tcp -d 31.13.64.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.65.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.66.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.67.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.68.52/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.69.240/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.70.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.71.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.72.52/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.73.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.74.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.75.52/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.76.81/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.77.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.78.53/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.79.195/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.80.53/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.81.53/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.82.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.83.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.84.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.85.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.86.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.87.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.88.49/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.90.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.91.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.92.52/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.93.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.95.63/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.198.204/30 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.210.32/30 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.210.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.225.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.235.248/30 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.22.240.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.23.90.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 50.97.57.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 75.126.39.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.174.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.176.192/26 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.177.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.180.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.254.65/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.255.224/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 108.168.255.227/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.0.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.5.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.46.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.48.224/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.58.0/25 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.61.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.224.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.233.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.249.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.249.224/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 158.85.254.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.44.36.0/25 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.71.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.71.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.87.128/26 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.169.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.182.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.45.214.224/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.53.29.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.53.71.224/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.53.250.128/26 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.54.2.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.54.51.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.54.55.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.54.210.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.54.222.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.55.69.128/26 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.55.74.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.55.126.64/26 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.55.210.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 169.55.235.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.192.162.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.192.219.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.192.222.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.192.231.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.193.205.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.96/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 173.193.239.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.36.208.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.36.210.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.36.251.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.37.199.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.37.217.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.37.231.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.37.243.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 174.37.251.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 179.60.192.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 179.60.193.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 179.60.195.51/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.136.64/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.147.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.161.64/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.161.160/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.173.116/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.179.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 184.173.204.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 192.155.212.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 198.11.193.182/31 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 198.11.251.32/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 198.23.80.0/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 208.43.115.192/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 208.43.117.79/32 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 208.43.122.128/27 --dport 443 -j DROP
iptables -A FORWARD -p tcp -d 31.13.64.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.65.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.66.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.67.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.68.52/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.69.240/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.70.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.71.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.72.52/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.73.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.74.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.75.52/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.76.81/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.77.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.78.53/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.79.195/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.80.53/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.81.53/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.82.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.83.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.84.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.85.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.86.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.87.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.88.49/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.90.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.91.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.92.52/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.93.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 31.13.95.63/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.198.204/30 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.210.32/30 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.210.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.225.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.235.248/30 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.22.240.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.23.90.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 50.97.57.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 75.126.39.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.174.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.176.192/26 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.177.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.180.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.254.65/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.255.224/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 108.168.255.227/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.0.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.5.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.46.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.48.224/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.58.0/25 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.61.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.224.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.233.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.249.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.249.224/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 158.85.254.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.44.36.0/25 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.71.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.71.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.87.128/26 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.169.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.182.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.45.214.224/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.53.29.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.53.71.224/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.53.250.128/26 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.54.2.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.54.51.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.54.55.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.54.210.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.54.222.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.55.69.128/26 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.55.74.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.55.126.64/26 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.55.210.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 169.55.235.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.192.162.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.192.219.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.192.222.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.192.231.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.193.205.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.96/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.193.230.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 173.193.239.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.36.208.128/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.36.210.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.36.251.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.37.199.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.37.217.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.37.231.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.37.243.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 174.37.251.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 179.60.192.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 179.60.193.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 179.60.195.51/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.136.64/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.147.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.161.64/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.161.160/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.173.116/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.179.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 184.173.204.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 192.155.212.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 198.11.193.182/31 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 198.11.251.32/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 198.23.80.0/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 208.43.115.192/27 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 208.43.117.79/32 --dport 80 -j DROP
iptables -A FORWARD -p tcp -d 208.43.122.128/27 --dport 80 -j DROP
####IPV6 BLOCK WHATSAPP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1301:17d::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b01:d4::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b02:14d::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b04:32::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:2102:229::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:2601:37::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3003:1bc::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3004:136::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3004:174::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3005:183::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3005:1a3::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3006:84::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3006:af::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3801:38::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3802:48::/64  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f000:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f001:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f002:10f:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f003:c0d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f004:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f005:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f006:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f007:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f008:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f009:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00a:12:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00b:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00c:12:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00c:11e:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00d:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00e:12:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00f:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f011:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f012:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f013:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f014:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f015:1c:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f016:13:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f017:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f018:f:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f019:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01a:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01b:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01c:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01c:215:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01f:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f021:11:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f022:d:face:b00c::167/128  --dport 443 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1301:17d::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b01:d4::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b02:14d::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:1b04:32::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:2102:229::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:2601:37::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3003:1bc::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3004:136::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3004:174::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3005:183::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3005:1a3::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3006:84::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3006:af::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3801:38::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2607:f0d0:3802:48::/64  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f000:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f001:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f002:10f:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f003:c0d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f004:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f005:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f006:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f007:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f008:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f009:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00a:12:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00b:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00c:12:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00c:11e:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00d:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00e:12:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f00f:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f011:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f012:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f013:d:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f014:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f015:1c:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f016:13:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f017:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f018:f:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f019:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01a:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01b:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01c:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01c:215:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f01f:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f021:11:face:b00c::167/128  --dport 80 -j DROP
ip6tables -A FORWARD -p tcp -d 2a03:2880:f022:d:face:b00c::167/128  --dport 80 -j DROP
