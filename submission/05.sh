# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
relativeBlocks=150

$relativeHex = "{0:x2}" -f $relativeBlocks

$pubKeyBytes = [System.Convert]::FromHexString($publicKey)

$sha256 = [System.Security.Cryptography.SHA256]::Create()
$sha256Hash = $sha256.ComputeHash($pubKeyBytes)

$ripemd160 = [System.Security.Cryptography.RIPEMD160]::Create()
$pubKeyHash = $ripemd160.ComputeHash($sha256Hash)

$pubKeyHashHex = ($pubKeyHash | ForEach-Object { $_.ToString("x2") }) -join ""

$redeemScript = "01$relativeHex" + "b27576a914$pubKeyHashHex" + "88ac"

echo $redeemScript