#!/bin/bash
# Dynamic Chameleon IP by mikey-7x (yogesh)                           pkg install chafa -y
pkg install chafa -y

# -------------------------------
# 🔥 Title and Branding
# -------------------------------
clear

# Define colors
GREEN="\e[32m"
BOLD_GREEN="\e[1;32m"
RESET="\e[0m"

# Display the 3D Chameleon Image using `chafa`
chafa "/storage/emulated/0/Pictures/3D DCI.PNG" --symbols=block
echo ""

# Faster Unique IP Changer Script
echo -e "\e[1;33m[+] Updating & Installing Dependencies...\e[0m"
pkg update -y && pkg upgrade -y
pkg install tor privoxy curl netcat-openbsd -y

# Set up Tor & Privoxy
echo -e "\e[1;32m[+] Configuring Tor and Privoxy...\e[0m"
pkill tor
pkill privoxy
rm -rf ~/.tor_multi ~/.privoxy
mkdir -p ~/.tor_multi ~/.privoxy

# Define ports
PORTS=(9050 9060 9070 9080 9090)
CONTROL_PORTS=(9051 9061 9071 9081 9091)

# Start multiple Tor instances
echo -e "\e[1;34m[+] Starting Tor Nodes...\e[0m"
for i in {0..4}; do
    TOR_DIR="$HOME/.tor_multi/tor$i"
    mkdir -p "$TOR_DIR"
    cat > "$TOR_DIR/torrc" <<EOF
SocksPort ${PORTS[$i]}
ControlPort ${CONTROL_PORTS[$i]}
DataDirectory $TOR_DIR
CookieAuthentication 0
MaxCircuitDirtiness 10
EOF
    tor -f "$TOR_DIR/torrc" > /dev/null 2>&1 &
    sleep 2
done

# Configure Privoxy
cat > "$HOME/.privoxy/config" <<EOF
listen-address 127.0.0.1:8118
EOF
for port in "${PORTS[@]}"; do
    echo "forward-socks5 / 127.0.0.1:$port ." >> "$HOME/.privoxy/config"
done
privoxy "$HOME/.privoxy/config" > /dev/null 2>&1 &

# IP Rotation Interval
echo -ne "\e[1;36mEnter IP rotation interval (in seconds, min 3s): \e[0m"
read -r ROTATION_TIME
if [[ ! "$ROTATION_TIME" =~ ^[0-9]+$ ]] || [[ "$ROTATION_TIME" -lt 3 ]]; then
    echo -e "\e[1;31mInvalid input! Using default 5 seconds.\e[0m"
    ROTATION_TIME=5
fi

# Unique IP Changing
LAST_IPS=()
while true; do
    RANDOM_INDEX=$((RANDOM % ${#CONTROL_PORTS[@]}))
    CTRL_PORT=${CONTROL_PORTS[$RANDOM_INDEX]}

    echo -e "AUTHENTICATE \"\"\r\nSIGNAL NEWNYM\r\nQUIT" | nc 127.0.0.1 $CTRL_PORT > /dev/null 2>&1
    sleep 2  # Allow Tor to refresh

    NEW_IP=$(curl --proxy http://127.0.0.1:8118 -s https://api64.ipify.org)

    if [[ -z "$NEW_IP" ]]; then
        echo -e "\e[1;31m⚠️ No IP detected! Retrying...\e[0m"
        sleep 2
        continue
    fi

    # Ensure IP is unique
    if [[ " ${LAST_IPS[*]} " =~ " $NEW_IP " ]]; then
        echo -e "\e[1;33m⚠️ Repeated IP! Retrying...\e[0m"
        sleep 1
        continue
    fi

    # Store last 5 IPs to avoid reuse
    LAST_IPS+=("$NEW_IP")
    if [[ ${#LAST_IPS[@]} -gt 5 ]]; then
        LAST_IPS=("${LAST_IPS[@]:1}")
    fi

    echo -e "\e[1;32m🌐 New IP: $NEW_IP ✅\e[0m"
    echo -e "\e[1;34m[Proxy]: 127.0.0.1:8118 🛰️\e[0m"

    sleep "$ROTATION_TIME"
done
