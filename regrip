####### Regrippter
cd $HOME
echo Installing Regripper 3.0 and win32-registry-perl
sudo su
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
sudo ln -s  /usr/local/src/regripper/plugins /usr/share/regripper/plugins 2>/dev/nul
sudo chmod 755 regripper/* || exit
#Copy RegRipper Specific perl modules
cp regripper/File.pm /usr/share/perl5/Parse/Win32Registry/WinNT/File.pm
cp regripper/Key.pm /usr/share/perl5/Parse/Win32Registry/WinNT/Key.pm
cp regripper/Base.pm /usr/share/perl5/Parse/Win32Registry/Base.pm

#Create file rip.pl.linux from original rip.pl
#[ -f regripper/rip.pl ] && echo "rip.pl found!" || echo "rip.pl not found!"
#[ -f regripper/rip.pl ] && cp regripper/rip.pl rip.pl.linux || exit
sudo cp regripper/rip.pl regripper/rip.pl.linux || exit
sudo sed -i '77i my \$plugindir \= \"\/usr\/share\/regripper\/plugins\/\"\;' /usr/local/src/regripper/rip.pl.linux 
sudo sed -i '/^#! c:[\]perl[\]bin[\]perl.exe/d' /usr/local/src/regripper/rip.pl.linux
sudo sed -i "1i #!`which perl`" /usr/local/src/regripper/rip.pl.linux
sudo sed -i '2i use lib qw(/usr/lib/perl5/);' /usr/local/src/regripper/rip.pl.linux
sudo md5sum /usr/local/src/regripper/rip.pl.linux && echo "rip.pl.linux file created!"

# Copy rip.pl.linux to /usr/local/bin/rip.pl
echo  Copy rip.pl.linux to /usr/local/bin/rip.pl
sudo cp regripper/rip.pl.linux /usr/local/bin/rip.pl && echo “ Success /usr/local/src/regripper/rip.pl.linux copied to /usr/local/bin/rip.pl” /usr/local/bin/rip.pl  && printf "\n\n  Regipper file rip.pl has been changed!!\n  Original file is located in /usr/local/src/regripper/rip.pl\n\n"
exit
