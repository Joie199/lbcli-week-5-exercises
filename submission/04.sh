# Create a CLTV script with a timestamp of 1495584032 and public key below:
publicKey="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"
timestamp="1495584032"

hash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $2}')

hext=$(printf '%08x\n' $timestamp | sed 's/^\(00\)*//')
time=$(echo $hext | tac -rs .. | tr -d '\n')
spk="04${time}b17576a914${hash}88ac"

echo "$spk"