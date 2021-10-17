# Setup
## Windows

### Prerequisites
- Have openssl installed and addded to PATH. Example version: OpenSSL 1.1.1k  25 Mar 2021.

### Step 1 (Generate Certificate)
- Go to the SampleAPI/ssl folder.
- Run make-cert.bat.
-  localhost.crt should be added to SampleAPI root folder.
- Go to Windows Certificate Manager and import the localhost.crt under Trusted Root Certification Authorithy.

### Step 2 (Run)
- docker-compose up in the root directory
- go to https://localhost:8001/swagger

Expected Result: The request to the other service should be made.
Actual Result: Certificate error.

Similar example: https://github.com/WireMock-Net/WireMock.Net/issues/517