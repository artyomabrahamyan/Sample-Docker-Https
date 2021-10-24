openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf -subj /CN=localhost
openssl pkcs12 -export -out localhost.pfx -inkey localhost.key -in localhost.crt -passout pass:localhost
mv localhost.crt ..
mkdir -p $HOME/.aspnet/https/
mv localhost.pfx $HOME/.aspnet/https/
rm localhost.key
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" ../localhost.crt