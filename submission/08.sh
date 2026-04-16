# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
publicKey="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"

pkhash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $2}')

seconds=$((6*30*24*60*60))
nvalue=$(($seconds/512))
hexvalue=$(printf '%x\n' $nvalue)
relativevalue=$(printf '%x\n' $((0x$hexvalue | 0x400000)))
script="03${relativevalue}b2 75 76 a9 14${pkhash}88 ac"

echo "$script"