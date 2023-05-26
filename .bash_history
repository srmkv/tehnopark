sudo apt update
св
cd
ls
pwd
ls
ls -la
git clone https://github.com/jitsi/jitsi-meet.git
ls
cd jitsi-meet/
ls -la
cd ..
git clone https://github.com/jitsi/lib-jitsi-meet.git
ls -la
ps
htop
sudo apt update]
sudo apt update
sudo apt install apt-transport-https
sudo apt-add-repository universe
sudo apt update
sudo hostnamectl set-hostname meet.board.system-logos.ru
sudo nano /etc/hosts
ping "$(hostname)"
echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list
wget https://prosody.im/files/prosody-debian-packages.key -O- | sudo apt-key add -
apt install lua5.2
sudo apt install lua5.2
curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null
sudo apt update
sudo ufw status verbose
sudo apt install jitsi-meet
exit
