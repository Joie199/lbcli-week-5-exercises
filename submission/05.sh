# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
blocks=150

pubKeyHash=$(echo -n "$publicKey" | xxd -r -p | sha256sum | awk '{print $1}' | xxd -r -p | openssl rmd160 -binary | xxd -p -c 100)


redeemscript="029600b27576a914${pubKeyHash}88ac"

echo "$redeemscript" 