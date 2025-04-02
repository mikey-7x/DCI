# DCI
Dynamic Chameleon ip (DCI) by mikey-7x

📌 About

Dynamic Chameleon IP (DCI) is an advanced IP rotation script designed for Termux on Android. It dynamically changes your IP address using multiple Tor nodes and Privoxy, ensuring frequent and verified IP changes for privacy and anonymity. Unlike traditional methods, it does not rely on VPNs or Airplane Mode toggling.

🚀 Features

✅ Fast IP Rotation – Get a new IP every few seconds.

✅ Auto Verification – Ensures IP actually changes before proceeding.

✅ Multi-Tor Nodes – Uses multiple Tor circuits for better reliability.

✅ Privoxy Proxy Support – Routes traffic securely via HTTP Proxy (127.0.0.1:8118).

✅ Failsafe Mechanism – Retries instantly if the IP remains unchanged.

✅ Lightweight & Efficient – Works smoothly even on low-end devices.


📦 Installation

1. Download & Give Execution Permission:

curl -O https://your-repo-link/IpChange.sh
chmod +x IpChange.sh


2. Run the Script:

./IpChange.sh



🔄 How It Works

1. Starts multiple Tor instances with separate SocksPorts.


2. Configures Privoxy to route traffic via Tor nodes.


3. Continuously sends new identity signals to force new IPs.


4. Verifies if the IP has actually changed.


5. If the IP remains the same, it forces an immediate retry.



⚙️ Usage

Manual Start:

./IpChange.sh

Set Custom Rotation Interval: (Minimum 3 seconds)

Enter IP rotation interval (in seconds, min 3s): [YOUR VALUE]

Using the Proxy in Apps or Scripts:

HTTP Proxy: 127.0.0.1:8118

Socks5 Proxy (optional): 127.0.0.1:9050



🛠 Troubleshooting

IP not changing?

Ensure Tor is running properly (tor --version to check installation).

Try increasing the rotation interval slightly.

Restart Termux and rerun the script.



📜 License

This project is open-source and free to use for educational and privacy purposes. 🚀

📢 Credits

Developed by mikey-7x (Yogesh) For queries, reach out via GitHub or forums!


---

💡 "Stay Anonymous, Stay Secure!"

