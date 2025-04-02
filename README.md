# DCI
🦎 Dynamic Chameleon IP (DCI) by mikey-7x

DCI is an advanced IP-changing script that dynamically alters your IP address at specified intervals using the Tor network. It enhances privacy, security, and anonymity while browsing the internet.


---

✨ Features

✔ No VPN or Airplane Mode Required – Works without toggling airplane mode or using VPN services.
✔ Automated IP Rotation – Changes IP at user-defined intervals for enhanced anonymity.
✔ Multi-Tor Instance Setup – Uses multiple Tor circuits for faster, more reliable IP changes.
✔ Privoxy Proxy Support – Allows browser & app integration for seamless anonymous browsing.
✔ Works Directly in Termux – No need for a separate Linux environment.
✔ Lightweight & Fast Execution – Optimized for minimal resource usage.


---

🚀 Setup & Installation

Step 1: Install Termux

Download Termux from F-Droid (Recommended) or Play Store.


Step 2: Download the Script

Run the following command in Termux:

curl -L -o DCI.sh https://raw.githubusercontent.com/mikey-7x/DCI/main/DCI.sh

Step 3: Give Execution Permission

chmod +x DCI.sh

Step 4: Run the Script

Start DCI by executing:

./DCI.sh

The script will prompt you to enter an IP rotation interval (e.g., 10 seconds).

It will take a few seconds to establish a new IP using the Tor network.

Once ready, it will display the proxy address (127.0.0.1) and port (e.g., 8118).



---

🌐 Configuring Proxy on Android (For Browsing)

1. Open Wi-Fi Settings on your Android device.


2. Tap on the connected Wi-Fi network and select Modify Network.


3. Scroll to Proxy Settings → Change from None to Manual.


4. Enter the Hostname as 127.0.0.1 and Port as 8118.


5. Save settings and exit.


6. Open a browser and visit What Is My IP to verify your new IP.




---

⚡ Performance & Optimization

The time taken to change the IP depends on device speed & network conditions.

Some IPs may take longer to rotate; the script ensures real-time verification.

Using multiple Tor instances enhances speed and reliability.



---

📜 License

This project is open-source and free to use for educational and privacy purposes. 🚀

📢 Credits

Developed by mikey-7x (Yogesh). For queries, reach out via GitHub or forums!

💡 "Stay Anonymous, Stay Secure!" 🔥

