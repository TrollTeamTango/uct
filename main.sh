cd ~
sudo apt update
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

####sudo apt install python3-pip
sudo apt-get install build-essential   -y
sudo apt-get install python2-dev   -y    


#####distom
cd ~
git clone https://github.com/gdabah/distorm.git
cd distorm
sudo chmod 755 setup.py
sudo python2 setup.py build install



######Yara
cd ~
git clone --recursive https://github.com/VirusTotal/yara-python
cd yara-python
sudo python setup.py build
sudo python setup.py install




######PyCripto
cd ~
git clone https://github.com/pycrypto/pycrypto.git
cd pycrypto
sudo chmod 755 setup.py
sudo ./setup.py install


######Volatility
cd ~
git clone https://github.com/volatilityfoundation/volatility.git
cd volatility
sudo chmod 755 setup.py
sudo chmod 755 vol.py


######Python3
cd ~
sudo apt install python3 


######Distom3
cd ~
git clone https://salsa.debian.org/debian/distorm3.git
cd distorm3
sudo chmod 755 setup.py
sudo python3 setup.py build install


######Volatility3
cd ~
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3
sudo chmod 755 setup.py    (or type sudo chmod 755 setup.py)
sudo chmod 755 vol.py
