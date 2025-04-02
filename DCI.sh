#!/bin/bash
# Dynamic Chameleon IP by mikey-7x (yogesh)

# -------------------------------
# 🔥 Title and Branding
# -------------------------------
clear
echo -e "\e[31m┌───────────────────────────────────────────────┐\e[0m"
echo -e "\e[31m│    \e[0m Dynamic Chameleon IP by mikey-7x (yogesh) \e[31m│\e[0m"
echo -e "\e[31m└───────────────────────────────────────────────┘\e[0m"
echo ""

# -------------------------------
# 1️⃣ Update & Install Required Packages  
# -------------------------------
echo -e "\e[1;33m[+] Updating Termux Packages...\e[0m"
pkg update -y && pkg upgrade -y

echo -e "\e[1;33m[+] Installing tor, privoxy, and curl...\e[0m"
pkg install tor privoxy curl netcat-openbsd -y

# -------------------------------
# 2️⃣ Setup Environment  
# -------------------------------
echo -e "\e[1;32m[+] Configuring Tor and Privoxy...\e[0m"
pkill tor
pkill privoxy
rm -rf ~/.tor_multi ~/.privoxy
mkdir -p ~/.tor_multi ~/.privoxy

# -------------------------------
# 3️⃣ Start Tor and Privoxy Services (Parallel Execution)
# -------------------------------
echo -e "\e[1;34m[+] Starting Tor Nodes & Proxy...\e[0m"
PORTS=(9050 9060 9070 9080 9090)
CONTROL_PORTS=(9051 9061 9071 9081 9091)

for i in {0..4}; do
    TOR_DIR="$HOME/.tor_multi/tor$i"
    mkdir -p "$TOR_DIR"
    cat <<EOF > "$TOR_DIR/torrc"
SocksPort ${PORTS[$i]}
ControlPort ${CONTROL_PORTS[$i]}
DataDirectory $TOR_DIR
CookieAuthentication 0
EOF
    tor -f "$TOR_DIR/torrc" > /dev/null 2>&1 &
    sleep 1  # Faster startup
done

# Privoxy Setup  
cat <<EOF > "$HOME/.privoxy/config"
listen-address 127.0.0.1:8118
EOF
for port in "${PORTS[@]}"; do
    echo "forward-socks5 / 127.0.0.1:$port ." >> "$HOME/.privoxy/config"
done
privoxy "$HOME/.privoxy/config" > /dev/null 2>&1 &

# -------------------------------
# 4️⃣ IP Rotation Time Interval  
# -------------------------------
echo -ne "\e[1;36mEnter IP rotation interval (in seconds, min 3s): \e[0m"
read -r ROTATION_TIME

if [[ ! "$ROTATION_TIME" =~ ^[0-9]+$ ]] || [[ "$ROTATION_TIME" -lt 3 ]]; then
    echo -e "\e[1;31mInvalid input! Using default 5 seconds.\e[0m"
    ROTATION_TIME=5
fi

# -------------------------------
# 5️⃣ Auto IP Changer with Verification  
# -------------------------------
LAST_IP=""

while true; do
    for ctrl_port in "${CONTROL_PORTS[@]}"; do
        echo -e "AUTHENTICATE \"\"\r\nSIGNAL NEWNYM\r\nQUIT" | nc 127.0.0.1 $ctrl_port > /dev/null 2>&1
    done

    # Wait briefly for Tor to apply the change
    sleep 2  

    # Fetch new IP
    NEW_IP=$(curl --proxy http://127.0.0.1:8118 -s https://api64.ipify.org)

    # Verify IP has really changed
    if [[ -z "$NEW_IP" ]]; then
        echo -e "\e[1;31m⚠️ No IP detected! Retrying...\e[0m"
        sleep 2
        continue
    elif [[ "$NEW_IP" == "$LAST_IP" ]]; then
        echo -e "\e[1;33m⚠️ IP didn't change! Retrying immediately...\e[0m"
        sleep 1
        continue
    fi

    # Update last IP and display new IP
    LAST_IP="$NEW_IP"
    echo -e "\e[1;32m🌐 New IP: $NEW_IP ✅\e[0m"
    echo -e "\e[1;34m[Proxy]: 127.0.0.1:8118 🛰️\e[0m"

    sleep "$ROTATION_TIME"
done
