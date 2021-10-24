# Setup

### Prerequisites
- Have openssl installed and addded to PATH. Example version: OpenSSL 1.1.1k  25 Mar 2021.

## Windows

### Generate Certificate
- Go to the SampleAPI/ssl folder.
- Run make-cert.bat.
- Go to Windows Certificate Manager and import the localhost.crt under Trusted Root Certification Authorithy.

## Mac OS

### Generate Certificate
- Go to the SampleAPI/ssl folder.
- sudo chmod 755 make-cert.sh
- Run make-cert.sh. (NOTE: trusting certificate will require super user privileges)

## Run
- docker-compose up in the root directory
- go to https://localhost:8001/swagger and make the request.
