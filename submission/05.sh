# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"
block="150"
hash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $2}')

hexvalue=$(printf '%06x\n' $block)
csv=$(echo $hexvalue | tac -rs .. | tr -d '\n')
script="03${csv}b27576a914${hash}88ac"
echo "$script"