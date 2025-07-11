# DCI
# **🦎 Dynamic Chameleon IP (DCI) by mikey-7x**

DCI is an advanced IP-changing script that dynamically alters your IP address at specified intervals using the Tor network. It enhances privacy, security, and anonymity while browsing the internet.




![Dynamic Chameleon IP](https://github.com/mikey-7x/DCI/blob/main/3D%20DCI.PNG?raw=true)



## **👁️‍🗨️Practical Implementation Video**  
Watch the Dynamic Chameleon ip (DCI) setup and execution in action:  

[![DCI YouTube Video](https://img.youtube.com/vi/RcVl_N31GGs/0.jpg)](https://youtu.be/RcVl_N31GGs)  

---

## **✨ Features**

✔ No VPN or Airplane Mode Required – Works without toggling airplane mode or using VPN services.

✔ Automated IP Rotation – Changes IP at user-defined intervals for enhanced anonymity.

✔ Multi-Tor Instance Setup – Uses multiple Tor circuits for faster and unique ip switching, more reliable IP changes.

✔ Smart IP Rotation – Prevents reuse of recent IPs to maintain uniqueness.

✔ Auto-Restart Mechanism – Ensures Tor and Privoxy run without manual intervention.

✔ Real-Time IP Check – Displays the new IP instantly after rotation.

✔ Visual Branding – Uses chafa to display a 3D chameleon logo in the terminal.

✔ Privoxy Proxy Support – Allows browser & app integration for seamless anonymous browsing.

✔ Works Directly in Termux – No need for a separate Linux environment.

✔ Lightweight & Fast Execution – Optimized for minimal resource usage.


---

## **🚀 Setup & Installation**

**🧩Step 1:** Install Termux

Download Termux from F-Droid (Recommended) or Play Store.


**🧩Step 2:** Download the Script

Run the following command in Termux:

```sh
curl -L -o DCI.sh https://raw.githubusercontent.com/mikey-7x/DCI/main/DCI.sh
```

**🧩Step 3:** Give Execution Permission

```sh
chmod +x DCI.sh
```

**🧩Step 4:** Run the Script

Start DCI by executing:

```sh
./DCI.sh
```

The script will prompt you to enter an IP rotation interval (e.g., 10 seconds).

It will take a few seconds to establish a new IP using the Tor network.

Once ready, it will display the proxy address (127.0.0.1) and port (e.g., 8118).



---

## **🌐 Configuring Proxy on Android (For Browsing)**

1. Open Wi-Fi Settings on your Android device.


2. Tap on the connected Wi-Fi network and select Modify Network.


3. Scroll to Proxy Settings → Change from None to Manual.


4. Enter the Hostname as 127.0.0.1 and Port as 8118.


5. Save settings and exit.


6. Open a browser and visit What Is My IP to verify your new IP.




---

## **⚡ Performance & Optimization**

The time taken to change the IP depends on device speed & network conditions.

Some IPs may take longer to rotate; the script ensures real-time verification.

Using multiple Tor instances enhances speed and reliability.



---

## 📄 License

This project is licensed under the [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

You are free to use, share, and adapt the content with attribution.

---

## **📜 Credits**  
Developed by **[mikey-7x](https://github.com/mikey-7x)** 🚀🔥  


[other repository](https://github.com/mikey-7x?tab=repositories)

 For queries, reach out via GitHub or forums!

💡 "Stay Anonymous, Stay Secure!" 

