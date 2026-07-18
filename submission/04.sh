# Create a CLTV script with a timestamp of 1495584032 and public key below:
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
locktime=1495584032
locktimeHex=$(printf "%08x" "$locktime" | sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/')
pubKeyHash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p -c 100)

redeemScript="04${locktimeHex}b17576a914${pubKeyHash}88ac"

echo "$redeemScript"