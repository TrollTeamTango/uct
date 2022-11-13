sudo apt update
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install ./google-chrome-stable_current_amd64.deb -y

####sudo apt install python3-pip
sudo apt-get install build-essential   -y
sudo apt-get install python2-dev   -y    

#####distom
git clone https://github.com/gdabah/distorm.git
cd distorm
sudo chmod 755 setup.py
sudo python2 setup.py build install
cd ..
######Yara
git clone --recursive https://github.com/VirusTotal/yara-python
cd yara-python
sudo python setup.py build
sudo python setup.py install
cd ..
######PyCripto
git clone https://github.com/pycrypto/pycrypto.git
cd pycrypto
sudo chmod 755 setup.py
sudo ./setup.py install
cd ..
######Volatility
git clone https://github.com/volatilityfoundation/volatility.git
cd volatility
sudo chmod 755 setup.py
sudo chmod 755 vol.py
cd ..

######Python3
sudo apt install python3 
######Distom3
git clone https://salsa.debian.org/debian/distorm3.git
cd distorm3
sudo chmod 755 setup.py
sudo python3 setup.py build install
cd ..
######Volatility3
git clone https://github.com/volatilityfoundation/volatility3.git
cd volatility3
sudo chmod 755 setup.py    (or type sudo chmod 755 setup.py)
sudo chmod 755 vol.py
cd ..
#Installs Regripper 3.0
#Installs latest RegRipper3.0
#Installs win32-registry-perl

echo sudo is required
echo git is required
echo apt is required
which git || exit
which apt || exit
apt-get install -y libparse-win32registry-perl -y
# Downloads RegRipper3.0 and moves file into /usr/local/src/regripper and "chmods" files in regripper directory to allow execution
cd /usr/local/src/
sudo rm -r /usr/local/src/regripper/ 2>/dev/nul
sudo rm -r /usr/share/regripper/plugins 2>/dev/nul
git clone https://github.com/keydet89/RegRipper3.0.git 
mv RegRipper3.0 regripper
mkdir /usr/share/regripper
ln -s  /usr/local/src/regripper/plugins /usr/share/regripper/plugins 2>/dev/nul
chmod 755 regripper/* || exit
#Copy RegRipper Specific perl modules
cp regripper/File.pm /usr/share/perl5/Parse/Win32Registry/WinNT/File.pm
cp regripper/Key.pm /usr/share/perl5/Parse/Win32Registry/WinNT/Key.pm
cp regripper/Base.pm /usr/share/perl5/Parse/Win32Registry/Base.pm

#Create file rip.pl.linux from original rip.pl
#[ -f regripper/rip.pl ] && echo "rip.pl found!" || echo "rip.pl not found!"
#[ -f regripper/rip.pl ] && cp regripper/rip.pl rip.pl.linux || exit
cp regripper/rip.pl regripper/rip.pl.linux || exit
sed -i '77i my \$plugindir \= \"\/usr\/share\/regripper\/plugins\/\"\;' /usr/local/src/regripper/rip.pl.linux 
sed -i '/^#! c:[\]perl[\]bin[\]perl.exe/d' /usr/local/src/regripper/rip.pl.linux
sed -i "1i #!`which perl`" /usr/local/src/regripper/rip.pl.linux
sed -i '2i use lib qw(/usr/lib/perl5/);' /usr/local/src/regripper/rip.pl.linux
md5sum /usr/local/src/regripper/rip.pl.linux && echo "rip.pl.linux file created!"

# Copy rip.pl.linux to /usr/local/bin/rip.pl
cp regripper/rip.pl.linux /usr/local/bin/rip.pl && echo “ Success /usr/local/src/regripper/rip.pl.linux copied to /usr/local/bin/rip.pl”
/usr/local/bin/rip.pl  && printf "\n\n  Regipper file rip.pl has been changed!!\n  Original file is located in /usr/local/src/regripper/rip.pl\n\n"

