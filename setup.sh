mkdir -p LAB
if [ ! -f 'LAB/LWP.json' ]; then
  echo '{"Protocol":"[protocol here]","Address":"[ip/site here]"}' > 'LAB/LWP.json'
fi

sudo apt-get update -y && sudo apt-get install -y --no-install-recommends apt-utils && sudo apt upgrade -y
sudo apt-get update -y && sudo apt-get install -y git cmake curl wget gcc make build-essential tzdata
sudo apt-get install -y libssl-dev zlib1g-dev libgmp-dev ftp nmap binwalk exiftool socat tshark ffuf
sudo apt-get install -y openvpn

if [ -z "$(which john)" ]; then
  git clone https://github.com/openwall/john -b bleeding-jumbo john
  cd john/src
  ./configure
  sudo make -j$(nproc)
  sudo mv ../run/* /usr/local/bin/
  cd ../..
  sudo rm -rf john
  echo 'alias john="/usr/local/bin/john"' >> ~/.bashrc
  sudo apt autoremove
fi

if [ ! -f 'LAB/rockyou.txt' ]; then
  wget -O LAB/rockyou.txt.gz https://github.com/zacheller/rockyou/raw/refs/heads/master/rockyou.txt.tar.gz
  gzip -d LAB/rockyou.txt.gz
fi

if [ ! -f 'LAB/commonweb.txt' ]; then
  wget -O LAB/commonweb.txt https://github.com/danielmiessler/SecLists/raw/refs/heads/master/Discovery/Web-Content/common.txt
fi