cd $HOME
sudo apt update
echo downloading chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
echo installing chrome
sudo apt install ./google-chrome-stable_current_amd64.deb -y
####sudo apt install python3-pip
cd $HOME
echo build-essential
sudo apt-get install build-essential   -y
echo installing python2-dev
sudo apt-get install python2-dev   -y    
#####distom
cd $HOME
echo installing distom
git clone https://github.com/gdabah/distorm.git
cd distorm
sudo chmod 755 setup.py
sudo python2 setup.py build install
######Yara
cd $HOME
echo installing Yara
git clone --recursive https://github.com/VirusTotal/yara-python
cd yara-python
sudo python setup.py build
sudo python setup.py install
######PyCripto
cd $HOME
echo installing PyCripto
git clone https://github.com/pycrypto/pycrypto.git
cd pycrypto
sudo chmod 755 setup.py
sudo ./setup.py install
######Volatility
cd $HOME
echo installing Volatility
git clone https://github.com/volatilityfoundation/volatility.git
cd volatility
sudo chmod 755 setup.py
sudo chmod 755 vol.py
######Python3
cd $HOME
echo installing Python3
sudo apt install python3 -y
######Distom3
cd $HOME
echo installing DISTOM3
git clone https://salsa.debian.org/debian/distorm3.git
cd distorm3
sudo chmod 755 setup.py
sudo python3 setup.py build install 
cd ..
######Volatility3
cd $HOME
echo installing Volatility3
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3
sudo chmod 755 setup.py
sudo chmod 755 vol.py
cd $HOME
echo Installing Regripper 3.0 and win32-registry-perl
git clone https://github.com/gitpan/Parse-Win32Registry.git
sudo apt-get install -y libparse-win32registry-perl
cd /usr/local/src
git clone https://github.com/keydet89/RegRipper3.0.git
sudo mkdir -p   /usr/share/regripper/
sudo cp -r /usr/local/src/RegRipper3.0/plugins/  /usr/share/regripper/
sudo mv RegRipper3.0 regripper  
sudo ln -s  /usr/share/regripper    /usr/local/src/regripper/plugins    
sudo chmod 755 regripper/*
cd   /usr/local/src/regripper
sudo cp File.pm   /usr/share/perl5/Parse/Win32Registry/WinNT/File.pm
sudo cp Key.pm   /usr/share/perl5/Parse/Win32Registry/WinNT/Key.pm
sudo cp Base.pm   /usr/share/perl5/Parse/Win32Registry/WinNT/Base.pm
