---
title: tech-symposium-2025-ctf
layout: default
permalink: /writeups/other/:title/
tags: [writeup]
category: Other
---

# [tech-symposium-2025-ctf](https://techsymposium.calpolyswift.org/)

Capture the flag event made for SWIFT's annual Tech Symposium.

Co-Creators:
Maxwell Caron (me)
Molly Chen ([https://www.linkedin.com/in/mollylchen/](https://www.linkedin.com/in/mollylchen/))

<br>

## Table of Contents

<hr />

#### Start Here
- [start](#start)

#### Open Source Intelligence (OSINT)
- [Find The CVE](#find-the-cve)
- [Connect with Me 👀](#connect-with-me-)
- [Mayor's Insta Handle](#mayors-insta-handle)
- [Wild Goose Chase](#wild-goose-chase)

#### Crypto / Hash
- [1 Cheese Lasagna](#1-cheese-lasagna)
- [Find the First Name](#find-the-first-name)
- [2 Cheese Lasagna](#2-cheese-lasagna)
- [Your Turn](#your-turn)
- [Flip Flop](#flip-flop)
- [Onion](#onion)
- [Samuel's Code](#samuels-code)

#### Cloud / Web
- [No Free Advertisement](#no-free-advertisement)
- [Great Content](#great-content)
- [Birthday](#birthday)
- [Secret Mission](#secret-mission)
- [Lamb Duh](#lamb-duh)
- [The Forge](#the-forge)

<br>

## Start Here

<hr />

<br>

### start

> Send the flag in this format: TECH25{FLAG}
>
> Try sending in the flag attached. Password = SWIFT
> 
> [start.zip](/assets/files/start.zip)

Open `start.zip` and enter `SWIFT` as the password. The flag is located in the `start.txt` file.

Flag
```
TECH25{M@ST3R_H@CK3R}
```

<br><br>

## Open Source Intelligence (OSINT)

<hr />

<br>

### Find the CVE

> Send the flag in this format: TECH25{CVE-YYYY-XXXXX}
> ![20250415142507](/assets/img/Pasted image 20250415142507.png)

If we Reverse Image Search the picture, it returns as “toy poodle”. With this, you can look up “toy poodle CVE.”

![20250415142642](/assets/img/Pasted image 20250415142642.png)

Flag
```
TECH25{CVE-2014-3566}
```

<br>

### Connect With Me 👀

> Send the flag in this format: TECH25{FLAG}
>
> One of the CTF Creators here! I love cryptography 😋 https://www.youtube.com/@cppswift

Scroll through [SWIFT’s YouTube](https://www.youtube.com/@cppswift) until you see a video on the topic of cryptography.

![20250415143823](/assets/img/Pasted image 20250415143823.png)

Find the name of the person leading the workshop by clicking on one of the videos.

![20250415143806](/assets/img/Pasted image 20250415143806.png)

“Connect With Me” was hinting towards LinkedIn. After finding ["Molly Chen" on LinkedIn](https://www.linkedin.com/in/mollylchen/), the flag was posted on her About.

![20250415143938](/assets/img/Pasted image 20250415143938.png)

Flag
```
TECH25{H3LL0_T3CH_SYMP0S1UM}
```

<br>

### Mayor's Insta Handle

> Send the flag in this format: TECH25{FLAG}
>
> Location: apprehend chanting seabird

If you search “How could you find a location with 3 words?”, you find the site [what3words.com](https://what3words.com). Using this website, we can enter "`apprehend.chanting.seabird`" and find the location of Idyllwild, California.

![20250415144354](/assets/img/Pasted image 20250415144354.png)

Searching for the Idyllwild Mayor’s Instagram, we find the following account.

![20250415144431](/assets/img/Pasted image 20250415144431.png)

Flag
```
TECH25{MAYORMAX1}
```

<br>

### Wild Goose Chase

> Send the flag in this format: TECH25{FLAG}
> ![gooseqr](/assets/img/gooseqr.jpg)

When trying to scan this QR code nothing happens. This is because it is too discolored to scan. We can use a tool like [QRazybox](https://merri.cx/qrazybox/) to reconstruct the QR code. Doing so, gives us a scannable QR code.

![20250421212707](/assets/img/Pasted image 20250421212707.png)

This QR code, when scanned, leads to an image hosted on google drive.

![20250421212731](/assets/img/Pasted image 20250421212731.png)

When this image is analyzed using a layer analysis tool like [Aperi’Solve](https://www.aperisolve.com/), the flag is found in the `Zsteg` section.

![20250421212827](/assets/img/Pasted image 20250421212827.png)

Flag
```
TECH25{H3LL0_S1LLY_G00s3}
```

<br><br>

## Crypto / Hash

<hr />

<br>

### 1 Cheese Lasagna

> Send the flag in this format: TECH25{FLAG}
>
> XIGL25{GMTLIVFVIEOIV}

We’re given the ciphertext: XIGL25{GMTLIVFVIEOIV}. With the hint of “Julius”, it can be assumed this is encrypted with the Caesar Cipher. The Caesar Cipher also shows as a suggestion when a Cipher Identifier is used. Using a cipher decoder, such as the one from [dcode.fr](https://www.dcode.fr/caesar-cipher), we can find the flag.

![20250421213059](/assets/img/Pasted image 20250421213059.png)

Flag
```
TECH25{CIPHERBREAKER}
```

<br>

### Find the First Name

> Send the flag in this format: TECH25{FLAG}
>
> 2a711da9185064896ee6091d294c834e

We’re given the ciphertext “2a711da9185064896ee6091d294c834e”. Using a Cipher Identifier, this string is identified as an MD5 hash.

![20250421213233](/assets/img/Pasted image 20250421213233.png)

Using a Hash Cracker like [CrackStation](https://crackstation.net/), the hash is revealed as “`superman1`”. Superman is known as Clark Kent.

Flag
```
TECH25{CLARK}
```

<br>

### 2 Cheese Lasagna

> Send the flag in this format: TECH25{FLAG}
>
> YSWY25{UZ@CEY3LN_GZDJP}
>
> The lasagnas share keys 👀


We’re given the ciphertext “YSWY25{UZ@CEY3LN_GZDJP}” and told the lasagna’s share keys. If we look up ciphers that use keys, we find the Vigenère Cipher. The previous lasagna CTF uses a 4 character Caesar Cipher Shift. Therefore, our key is 4. However, the Vigenère Cipher only takes alphabetical keys so our key is four. Using a tool like [CyberChef](https://gchq.github.io/CyberChef/), we can find the flag.

![20250421213450](/assets/img/Pasted image 20250421213450.png)

Flag
```
TECH25{PL@INT3XT_PUPPY}
```

<br>

### Your Turn

> Send the flag in this format: TECH25{hash}
>
> Hash "TECH25{Y0U_G0T_TH15!}" in SHA256.
>
> Salt with our Graphic Designer's Last Name IN ALL CAPS.
>
> Formula: HASH+SALT

We’re told to hash "TECH25{Y0U_G0T_TH15!}" in SHA256. Additionally, we need to add a salt of SWIFT’s Graphic Designer's Last Name. With a search, we find GONZALEZ will be our salt.

![20250421213524](/assets/img/Pasted image 20250421213524.png)

Using a tool like [CyberChef](https://gchq.github.io/CyberChef/) we can create the hash that is also our flag.

![20250421213722](/assets/img/Pasted image 20250421213722.png)


Flag
```
TECH25{39e732aa3233d06959601d62422d9a1aee95ec80f6dc68668d9533fa513a9fcc}
```

<br>

### Flip Flop

> Send the flag in this format: TECH25{FLAG}
>
> 11001000 11001110 11011111 11000111 11001001 11011111 11000111 11000111 11011111 11000111 11001100 11011111 11001010 11001111 11011111 11001010 11001100 11011111 11001110 11001101 11001100 11011111 11000111 11001000 11011111 11001010 11001110 11011111 11000111 11000111 11011111 11001011 11000111 11011111 11000111 11001000 11011111 11000111 11001001 11011111 11000110 11001010 11011111 11000111 11001000 11011111 11001001 11001011 11011111 11001001 11000111 11011111 11000111 11001011 11011111 11001110 11001101 11001010

We’re given a string of binary values. If we use a binary decoder like [CyberChef](https://gchq.github.io/CyberChef/), the output doesn’t look right. Referring to the CTF title, these binary values have to be “flipped”

![20250421213808](/assets/img/Pasted image 20250421213808.png)

Once the binary values are flipped, with 1s as 0s and 0s as 1s, the resulting hexadecimal output is generated.

![20250421213824](/assets/img/Pasted image 20250421213824.png)

Decoding from Hexadecimal, the following output is generated

![20250421213840](/assets/img/Pasted image 20250421213840.png)

Using a cipher identifier, the string is identified as the Affine Cipher. Using an [Affine Decoder](https://www.dcode.fr/affine-cipher), the final flag is found.

![20250421213911](/assets/img/Pasted image 20250421213911.png)

Flag
```
TECH25{D3C0DE_D@WG}.
```

<br>

### Onion

> Send the flag in this format: TECH25{FLAG}
>
> 60 115 154 56 151 76 41 143 152 106 76 101 107 154 143 56 123 164 53 106 102 144 67 45 162 62 110 52 72 63 63 135 47 52 50 61 111 75 105 43 74 134 111 135 72 62 106 124 70 137 65 162 105 53 146 76 72 137 163 131 66 41 43 154 150 61 61 105 133 65 67 152 103 123 157 62 47 154 141 102 74 103 61 115 76 55 73 44 44 143 75 165 136 50 117 54 72 76 127 136 67 122 47 75 133 54 73 136 127 74 61 61 63 103 54 73 141 131 56 131 55 162 75 43 72 60 153 74 111 127 54 73 116 133 150 64 163 127 106 57 101 124 62 143 130 63 46 115 155 47 64 132 155 42 54 102 57 53 44 134 67 153 143 123 153 65 76 110 70 124 67 64 115 46 67 62 102 143 160 132 77 125 143 70 126 76 163 147 107 116 75 43 73 71 146 54 71 134 141 64 62 110 64 63 127 64 44 66 164 124 104 136 133 54 77 73 145 156 71 114 104 60 46 165 153 63 106 164 55 76 62 105 65 101 106 54 74 145 42 141 66 161 115 115 127 55 124 106 107 53 61 114 141 45 43 62 105 116 74 162 75 103 41 133 61 71 120 70 105 65 61 106 76 45 161 64 42 117 44 60 63 134 107 112 50 76 46 154 113 44 106 50 44 100 133 73 142 112 70 151 64 42 130 76 130 77 72 46 66 163 71 112 123 75 121 67 123 66 127 107 103 52 153 165 112 63 46 63 155 101 73 105 70 73 70 60 153 162 136 134 100 67 106 77 120 60 145 76 111 62 66 163 161 77 120 105 46 47 147 55 54 127 145 75 107 66 157 124 47 120 67 153 122 50 126 60 153 74 147 47 57 114 164 41 145 71 115 100 52 123 77 124 136 134 106 55 74 126 130 46 66 75 163 147 157 102 56 154 46 115 77 122 45 155 60 100 64 107 107 76 104 103 146 63 106 65 102 114 71 157 104 140 125 102 130 56 156 104 113 106 55 157 153 63 152 105 53 116 41 142 57 157 42 122 56 54 126 52 50 163 70 150 162 42 102 60 57 55 140 147 55 130 156 156 156 60 62 77 45 77 54 126 52 46 41 60 57 164 141 67 53 132 74 75 126 66 42 161 135 101 62 140 140 165 131 55 124 152 133 122 57 71 117 74 117 55 156 156 45 124 102 115 140 134 150 62 140 153 107 113 63 46 116 146 144 65 162 61 164 157 73 104 61 116 154 63 137 116 111 75 62 52 117 145 140 101 62 107 132 126 72 147 143 45 144 75 77 56 140 145 74 51 122 136 72 66 130 162 156 135 104 140 72 124 117 106 47 114 134 104 56 121 62 52 43 106 130 126 46 156 61 61 62 70 60 61 54 74 105 104 62 110 124

Based on the pattern of separated numbers, we can infer that this might be octal encoding. Decoding leads to a scrambled string containing characters, numbers, and symbols.

```
0Ml.i>!cjF>AGlc.St+FBd7%r2H*:33]'*(1I=E#<\I]:2FT8_5rE+f>:_sY6!#lh11E[57jCSo2'laB<C1M>-;$$c=u^(O,:>W^7R'=[,;^W<113C,;aY.Y-r=#:0k<IW,;N[h4sWF/AT2cX3&Mm'4Zm",B/+$\7kcSk5>H8T74M&72BcpZ?Uc8V>sgGN=#;9f,9\a42H43W4$6tTD^[,?;en9LD0&uk3Ft->2E5AF,<e"a6qMMW-TFG+1La%#2EN<r=C![19P8E51F>%q4"O$03\GJ(>&lK$F($@[;bJ8i4"X>X?:&6s9JS=Q7S6WGC*kuJ3&3mA;E8;80kr^\@7F?P0e>I26sq?PE&'g-,We=G6oT'P7kR(V0k<g'/Lt!e9M@*S?T^\F-<VX&6=sgoB.l&M?R%m0@4GG>DCf3F5BL9oD`UBX.nDKF-ok3jE+N!b/o"R.,V*(s8hr"B0/-`g-Xnnn02?%?,V*&!0/ta7+Z<=V6"q]A2``uY-Tj[R/9O<O-nn%TBM`\h2`kGK3&Nfd5r1to;D1Nl3_NI=2*Oe`A2GZV:gc%d=?.`e<)R^:6Xrn]D`:TOF'L\D.Q2*#FXV&n112801,<ED2HT
```

With the help of [CyberChef](https://gchq.github.io/CyberChef/#recipe=From_Octal\('Space'\)&input=NjAgMTE1IDE1NCA1NiAxNTEgNzYgNDEgMTQzIDE1MiAxMDYgNzYgMTAxIDEwNyAxNTQgMTQzIDU2IDEyMyAxNjQgNTMgMTA2IDEwMiAxNDQgNjcgNDUgMTYyIDYyIDExMCA1MiA3MiA2MyA2MyAxMzUgNDcgNTIgNTAgNjEgMTExIDc1IDEwNSA0MyA3NCAxMzQgMTExIDEzNSA3MiA2MiAxMDYgMTI0IDcwIDEzNyA2NSAxNjIgMTA1IDUzIDE0NiA3NiA3MiAxMzcgMTYzIDEzMSA2NiA0MSA0MyAxNTQgMTUwIDYxIDYxIDEwNSAxMzMgNjUgNjcgMTUyIDEwMyAxMjMgMTU3IDYyIDQ3IDE1NCAxNDEgMTAyIDc0IDEwMyA2MSAxMTUgNzYgNTUgNzMgNDQgNDQgMTQzIDc1IDE2NSAxMzYgNTAgMTE3IDU0IDcyIDc2IDEyNyAxMzYgNjcgMTIyIDQ3IDc1IDEzMyA1NCA3MyAxMzYgMTI3IDc0IDYxIDYxIDYzIDEwMyA1NCA3MyAxNDEgMTMxIDU2IDEzMSA1NSAxNjIgNzUgNDMgNzIgNjAgMTUzIDc0IDExMSAxMjcgNTQgNzMgMTE2IDEzMyAxNTAgNjQgMTYzIDEyNyAxMDYgNTcgMTAxIDEyNCA2MiAxNDMgMTMwIDYzIDQ2IDExNSAxNTUgNDcgNjQgMTMyIDE1NSA0MiA1NCAxMDIgNTcgNTMgNDQgMTM0IDY3IDE1MyAxNDMgMTIzIDE1MyA2NSA3NiAxMTAgNzAgMTI0IDY3IDY0IDExNSA0NiA2NyA2MiAxMDIgMTQzIDE2MCAxMzIgNzcgMTI1IDE0MyA3MCAxMjYgNzYgMTYzIDE0NyAxMDcgMTE2IDc1IDQzIDczIDcxIDE0NiA1NCA3MSAxMzQgMTQxIDY0IDYyIDExMCA2NCA2MyAxMjcgNjQgNDQgNjYgMTY0IDEyNCAxMDQgMTM2IDEzMyA1NCA3NyA3MyAxNDUgMTU2IDcxIDExNCAxMDQgNjAgNDYgMTY1IDE1MyA2MyAxMDYgMTY0IDU1IDc2IDYyIDEwNSA2NSAxMDEgMTA2IDU0IDc0IDE0NSA0MiAxNDEgNjYgMTYxIDExNSAxMTUgMTI3IDU1IDEyNCAxMDYgMTA3IDUzIDYxIDExNCAxNDEgNDUgNDMgNjIgMTA1IDExNiA3NCAxNjIgNzUgMTAzIDQxIDEzMyA2MSA3MSAxMjAgNzAgMTA1IDY1IDYxIDEwNiA3NiA0NSAxNjEgNjQgNDIgMTE3IDQ0IDYwIDYzIDEzNCAxMDcgMTEyIDUwIDc2IDQ2IDE1NCAxMTMgNDQgMTA2IDUwIDQ0IDEwMCAxMzMgNzMgMTQyIDExMiA3MCAxNTEgNjQgNDIgMTMwIDc2IDEzMCA3NyA3MiA0NiA2NiAxNjMgNzEgMTEyIDEyMyA3NSAxMjEgNjcgMTIzIDY2IDEyNyAxMDcgMTAzIDUyIDE1MyAxNjUgMTEyIDYzIDQ2IDYzIDE1NSAxMDEgNzMgMTA1IDcwIDczIDcwIDYwIDE1MyAxNjIgMTM2IDEzNCAxMDAgNjcgMTA2IDc3IDEyMCA2MCAxNDUgNzYgMTExIDYyIDY2IDE2MyAxNjEgNzcgMTIwIDEwNSA0NiA0NyAxNDcgNTUgNTQgMTI3IDE0NSA3NSAxMDcgNjYgMTU3IDEyNCA0NyAxMjAgNjcgMTUzIDEyMiA1MCAxMjYgNjAgMTUzIDc0IDE0NyA0NyA1NyAxMTQgMTY0IDQxIDE0NSA3MSAxMTUgMTAwIDUyIDEyMyA3NyAxMjQgMTM2IDEzNCAxMDYgNTUgNzQgMTI2IDEzMCA0NiA2NiA3NSAxNjMgMTQ3IDE1NyAxMDIgNTYgMTU0IDQ2IDExNSA3NyAxMjIgNDUgMTU1IDYwIDEwMCA2NCAxMDcgMTA3IDc2IDEwNCAxMDMgMTQ2IDYzIDEwNiA2NSAxMDIgMTE0IDcxIDE1NyAxMDQgMTQwIDEyNSAxMDIgMTMwIDU2IDE1NiAxMDQgMTEzIDEwNiA1NSAxNTcgMTUzIDYzIDE1MiAxMDUgNTMgMTE2IDQxIDE0MiA1NyAxNTcgNDIgMTIyIDU2IDU0IDEyNiA1MiA1MCAxNjMgNzAgMTUwIDE2MiA0MiAxMDIgNjAgNTcgNTUgMTQwIDE0NyA1NSAxMzAgMTU2IDE1NiAxNTYgNjAgNjIgNzcgNDUgNzcgNTQgMTI2IDUyIDQ2IDQxIDYwIDU3IDE2NCAxNDEgNjcgNTMgMTMyIDc0IDc1IDEyNiA2NiA0MiAxNjEgMTM1IDEwMSA2MiAxNDAgMTQwIDE2NSAxMzEgNTUgMTI0IDE1MiAxMzMgMTIyIDU3IDcxIDExNyA3NCAxMTcgNTUgMTU2IDE1NiA0NSAxMjQgMTAyIDExNSAxNDAgMTM0IDE1MCA2MiAxNDAgMTUzIDEwNyAxMTMgNjMgNDYgMTE2IDE0NiAxNDQgNjUgMTYyIDYxIDE2NCAxNTcgNzMgMTA0IDYxIDExNiAxNTQgNjMgMTM3IDExNiAxMTEgNzUgNjIgNTIgMTE3IDE0NSAxNDAgMTAxIDYyIDEwNyAxMzIgMTI2IDcyIDE0NyAxNDMgNDUgMTQ0IDc1IDc3IDU2IDE0MCAxNDUgNzQgNTEgMTIyIDEzNiA3MiA2NiAxMzAgMTYyIDE1NiAxMzUgMTA0IDE0MCA3MiAxMjQgMTE3IDEwNiA0NyAxMTQgMTM0IDEwNCA1NiAxMjEgNjIgNTIgNDMgMTA2IDEzMCAxMjYgNDYgMTU2IDYxIDYxIDYyIDcwIDYwIDYxIDU0IDc0IDEwNSAxMDQgNjIgMTEwIDEyNA), it is able to identify that this decoded text is actually many layers of Base85 and Base64 encoded ciphertext.

![20250414231200](/assets/img/Pasted image 20250414231200.png)

CyberChef is able to fully decode all of the layers and find the flag.

![20250414231258](/assets/img/Pasted image 20250414231258.png)

Flag
```
TECH25{0GR3S_R_L1K3_0N10N5}
```

<br>

### Samuel's Code

> Send the flag in this format: TECH25{FLAG}
>
> E I ZILI IIII IILZL IIIII{EILI ZLEEZ LII I LIEI IEI IELILI ZILI EIZ I IEI}

We’re given the ciphertext “E I ZILI IIII IILZL IIIII{EILI ZLEEZ LII I LIEI IEI IELILI ZILI EIZ I IEI}”. The name of the CTF implies this cipher is Morse Code. Since Morse Code uses dots and dashes, we need to split these characters into those two categories. The dashes are represented by `E`, `Z`, and `L`. The dots are represented by I. After proper replacement, the result is a string of Morse Code. Using a Morse Code Decoder like [CyberChef](https://gchq.github.io/CyberChef/), the final flag is found.

![20250421214055](/assets/img/Pasted image 20250421214055.png)

Flag
```
TECH25{C0D3CR@CK3R}
```

<br><br>

## Cloud / Web

<hr />

<br>

### No Free Advertisement

>Send the flag in this format: TECH25{FLAG}
>
>What website did the Marine Monopolies intern use to find a spiffy html template for their company website? (no https://)
>
>https://marinemonopolies.github.io/

Most HTML templates have some sort of credits in forms of elements and or comments. We can find what website the intern used by looking at the source from clicking `Ctrl + U`.

![20250414211804](/assets/img/Pasted image 20250414211804.png)

Flag
```
TECH25{html5up.com}
```

<br>

### Great Content

> Send the flag in this format: TECH25{FLAG}
>
> What is the content length in bytes of the index.html page?
>
> https://marinemonopolies.github.io/index.html

Content-Length is a common HTTP response header that will tell us the length of the `index.html` page in bytes. We can view this response header by using your browser's web console which can be opened on most browsers with the shortcut `F12`. Once the web console is open we can navigate to the `Network` tab and completely reload the page using `Ctrl + Shift + R` and click on the `index.html` page.

![20250414212348](/assets/img/Pasted image 20250414212348.png)

Flag
```
TECH25{2103}
```

<br>

### Birthday

> Send the flag in this format: TECH25{YYYY-MM-DD}
>
> When was the domain name of the following website first created?
>
> https://www.calpolyswift.org/

We can find information about a certain domain by looking into its Whois record. In this case, I used the online web tool: [https://whois.domaintools.com/](https://whois.domaintools.com/). By inputting `calpolyswift.org` and completing the captcha we can see the creation date.

![20250414213118](/assets/img/Pasted image 20250414213118.png)

Flag
```
TECH25{2009-02-15}
```

<br>

### Secret Mission

> Send the flag in this format: TECH25{FLAG}
>
> From the following web page, look deep to uncover the top secret message file and its contents. Submit the encryption key.
>
> https://marinemonopolies.github.io/members.html

When we open the `members.html` page, we see numerous headshots of employees at Marine Monopolies. By viewing the page source using `Ctrl + U`, we discover that these headshots are dynamically loaded from an AWS S3 bucket at `https://marine-monopolies-storage.s3.us-west-1.amazonaws.com/`. Clicking on one of the employee headshot URLs opens the image in a new tab.

![20250414213745](/assets/img/Pasted image 20250414213745.png)

If we remove the direct reference to the `employee1.jpg` file we are taken to a directory listing of all the objects stored in the S3 bucket.

![20250414213702](/assets/img/Pasted image 20250414213702.png)

In this directory listing, we see more than just employee photos. Scrolling down, we see a `message.txt` file.

![20250414214112](/assets/img/Pasted image 20250414214112.png)

When navigating to `https://marine-monopolies-storage.s3.us-west-1.amazonaws.com/message.txt`, we can read the contents of the top secret message and find the encryption key.

![20250414214243](/assets/img/Pasted image 20250414214243.png)

Flag
```
TECH25{AquaCipher 7.9}
```

<br>

### Lamb Duh

> Send the flag in this format: TECH25{FLAG}
>
> Use the following lambda function URL to expose the contents of the flag.txt file.
>
> https://2eoythyetbxbij75ixtz3ayilu0jfiju.lambda-url.us-west-2.on.aws/?url=https://marinemonopolies.github.io

When clicking on the lambda URL we see what looks to be a response from a request out to the `https://marinemonopolies.github.io` page.

```json
{
  "url": "https://marinemonopolies.github.io",
  "status_code": 200,
  "content": "..."
}
```

Knowing we have control over the URL GET parameter `?url=` we can try to trick the lambda to read a local file by using the `file://` URI scheme.

![20250414215538](/assets/img/Pasted image 20250414215538.png)

Flag
```
TECH25{L4MBD4_FL4G_W0W}
```

<br>

### The Forge

> Send the flag in this format: TECH25{FLAG}
>
> Use the following status checker web page to leak the AWS credentials. Submit the name of the role that is attached to the website.
>
> (dead) http://ec2-44-244-149-193.us-west-2.compute.amazonaws.com/status?name=127.0.0.1%3A5001

When we click on the link, we are directed to a status page that indicates all systems are operational. Upon examining the URL, we notice that we can manipulate the `?name=` GET parameter, which currently points to `127.0.0.1`. This is the loopback address, a self-referencing IP address.

![20250415021035](/assets/img/Pasted image 20250415021035.png)

To determine whether there are any server-side checks or sanitizations applied to the `name` parameter, we can try changing its value to another website, such as `example.com`. Doing so, we see that the content of `example.com` is actually loaded.

![20250415021003](/assets/img/Pasted image 20250415021003.png)

This vulnerability, which allows an attacker to forge requests on behalf of the server to other external or internal hosts, is known as a [Server Side Request Forgery (SSRF)](https://portswigger.net/web-security/ssrf) vulnerability. We also note that this website is running on an AWS EC2 instance, as indicated by the DNS address. With these two pieces of information and some additional research we find that EC2 instances that are vulnerable to SSRF can potentially leak sensitive AWS credentials.

To leverage this SSRF vulnerability we replace the value of the `name` GET parameter to forge a request as the website to the EC2 instance's metadata service `http://169.254.169.254`. This metadata service, also known as [IMDS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html), includes instance details, network configurations, and temporary IAM role credentials. It is designed to be accessed by applications running within the instance, enabling them to configure themselves and manage their interactions with other AWS services.

This tricks the metadata service into thinking that the EC2 instance is trying to make a legitimate request to the service, resulting in sensitive data being returned to us.

![20250415021400](/assets/img/Pasted image 20250415021400.png)

To find the name of the role attached to the website and EC2 instance we have to navigate the file-system-like hierarchy until we reach `http://169.254.169.254/latest/meta-data/iam/security-credentials/`.

![20250415021721](/assets/img/Pasted image 20250415021721.png)

Flag
```
TECH25{S3ReadAccess}
```

<br><br>

## Results

![Top 10 Users](/assets/img/Top 10 Users.png)

![20250415022214](/assets/img/Pasted image 20250415022214.png)