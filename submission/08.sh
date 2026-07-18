# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

seconds=$((6*30*24*60*60))
csvValue=$((seconds/512))
csvValue=$((csvValue | 0x400000))

csvHex=$(printf "%06x" "$csvValue" | sed 's/\(..\)\(..\)\(..\)/\3\2\1/')

pubKeyHash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p -c 100)

redeemScript="03${csvHex}b27576a914${pubKeyHash}88ac"

echo "$redeemScript"