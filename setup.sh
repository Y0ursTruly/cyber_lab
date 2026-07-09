mkdir -p LAB
if [! -f 'LAB/LWP.json']; then
  echo '{"Protocol":"[protocol here]","Address":"[ip/site here]"}' > 'LAB/LWP.json'
fi

sudo apt-get update -y && apt-get install -y --no-install-recommends apt-utils && apt upgrade -y
sudo apt-get update -y && apt-get install -y git cmake curl wget gcc make build-essential tzdata
sudo apt-get install -y libssl-dev zlib1g-dev libgmp-dev ftp nmap

git clone https://github.com/openwall/john -b bleeding-jumbo john
cd john/src
./configure
sudo make -j$(nproc)
sudo mv ../run/* /usr/local/bin/
cd ../..
sudo rm -rf john
echo 'alias john="/usr/local/bin/john"' >> ~/.bashrc