
sudo apt-get install -y curl

echo Installing  RipGrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i ripgrep_12.1.1_amd64.deb
