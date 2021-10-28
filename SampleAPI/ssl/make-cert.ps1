function New-Cert
{
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf -subj /CN=localhost
    openssl pkcs12 -export -out localhost.pfx -inkey localhost.key -in localhost.crt -passout pass:localhost
}

function Add-Cert
{
    $dir = Get-Location
    $fileName = "localhost.crt"
    $file = "$dir\$fileName"
    $localhostCaCert = New-Object -TypeName "System.Security.Cryptography.X509Certificates.X509Certificate2" @($file)
    $storeName = [System.Security.Cryptography.X509Certificates.StoreName]::Root
    $storeLocation = [System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store($storeName, $storeLocation)
    $store.Open(([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite))
    try
    {
        $store.Add($localhostCaCert)
        Write-Output "$fileName is successfully added to the Trusted Root."
    }
    finally
    {
        $store.Close()
        $store.Dispose()
    }
}

function Move-Files
{
    $userProfile = $ENV:USERPROFILE
    $httpsDir = "$userProfile\.aspnet\https"

    if (!(Test-Path -Path $httpsDir))
    {
        New-Item -ItemType directory -Path $httpsDir
    }

    Move-Item "localhost.pfx" $httpsDir -Force
    Move-Item "localhost.crt" ..
    Remove-Item "localhost.key"
}

New-Cert
Add-Cert
Move-Files