# One Time Secret Docker Image
This image contains the web APP onetimesecret (https://onetimesecret.com/).   

### Image details
Base image: `fedora:latest`  
This image is designed to run on Kubernetes/OpenShift together with an REDIS container in a pod.  

### Variables
| Name | Description | Default value |
|---|---|---|
| OTS_DOMAIN | The domain name, which points to this instance | <none - required to be set> |
| OTS_MASTER_KEY | Global secret (gets combined with the users key to encrypt the secret) | <none - required to be set> |
| OTS_REDIS_PW | Password for REDIS access | <none - required to be set> |
| OTS_REDIS_HOST | The hostname or IP address of the REDIS instance | <none - required to be set> |
| OTS_REDIS_PORT | The port of the REDIS instance | <none - required to be set> |
| OTS_ADMIN_EMAIL | The email address of the admin user | <none - required to be set> |
| OTS_CREATE_SECRET |  | 250 |
| OTS_CREATE_ACCOUNT |  | 10 |
| OTS_UPDATE_ACCOUNT |  | 10 |
| OTS_EMAIL_RECIPIENT |  | 50 |
| OTS_SEND_FEEDBACK |  | 10 |
| OTS_AUTHENTICATE_SESSION |  | 5 |
| OTS_HOMEPAGE |  | 500 |
| OTS_DASHBOARD |  | 1000 |
| OTS_FAILED_PASSPHRASE |  | 5 |
| OTS_SHOW_METADATA |  | 1000 |
| OTS_SHOW_SECRET |  | 1000 |
| OTS_BURN_SECRET |  | 1000 |
