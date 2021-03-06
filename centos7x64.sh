#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo ""
echo "=========================================================================="
echo "= Pentest Attack Tools Setup                                             ="
echo "= Based on CentOS Linux release 7.6.1810 (Core)                          ="
echo "=========================================================================="
echo ""
echo "[+] Creating tools folder in /opt"
mkdir /opt/tools/
cd /opt/tools/
#net-tools 
yum install -y  net-tools wget bzip2 texlive  alien gnutls-utils git
#whois
yum install -y jwhois
#lresz (xshell file transfer)
#pip
yum install -y epel-release python-pip
#httpd (Http server)
yum install -y httpd
#nc
yum install -y nc
yum clean all
#wafw00f
pip install wafw00f
echo "[+] Installing net-tools whois nc httpd"
#waf_identify
cd /opt/tools/
git clone https://github.com/7z1/waf_identify
echo "alias whatweb='cd /opt/tools/waf_identify &&python3 waf.py '" >> ~/.bashrc
echo "[+] Installing waf_identify"
#whatweb
git clone https://github.com/urbanadventurer/whatweb
echo "alias whatweb='cd /opt/tools/whatweb &&./whatweb'" >> ~/.bashrc
#TideFinger
cd /opt/tools/
git clone https://github.com/TideSec/TideFinger
echo "alias tidefinger='cd /opt/tools/TideFinger && python TideFinger.py '" >> ~/.bashrc
echo "[+] Installing TideFinger"
#Pyhton3
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
yum clean all
wget https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz
tar -xvJf  Python-3.6.2.tar.xz
rm -rf Python-3.6.2.tar.xz
cd Python-3.6.2 && ./configure prefix=/usr/local/python3 
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
echo "[+] Installing python3 and pip3"
#frp
cd /opt/tools/
wget https://github.com/fatedier/frp/releases/download/v0.24.1/frp_0.24.1_linux_amd64.tar.gz
tar -zxvf frp_0.24.1_linux_amd64.tar.gz
rm -rf frp_0.24.1_linux_amd64.tar.gz
echo "alias frps='cd /opt/tools/frp_0.24.1_linux_amd64 && ./frps -c ./frps.ini'" >> ~/.bashrc
source ~/.bashrc
#Nikto 
git clone https://github.com/sullo/nikto
echo "alias nikto='cd /opt/tools/nikto/program &&./nikto.pl'" >> ~/.bashrc 
source ~/.bashrc
echo "[+] Installing Nikto"
#Arachni 
wget clone https://github.com/Arachni/arachni/releases/download/v1.5.1/arachni-1.5.1-0.5.12-linux-x86_64.tar.gz
tar -zxvf arachni-1.5.1-0.5.12-linux-x86_64.tar.gz
rm -rf arachni-1.5.1-0.5.12-linux-x86_64.tar.gz
echo "alias arachni='cd /opt/tools/arachni-1.5.1-0.5.12/bin && ./arachni_web --host 0.0.0.0'" >> ~/.bashrc 
echo "[+] Installing Arachni"
#w3af
cd /opt/tools/
yum install -y libxml2-devel libxslt-devel openssl-devel python-devel
git clone --depth 1 https://github.com/andresriancho/w3af.git
pip install --upgrade pip
pip install --upgrade setuptools
pip install lxml==3.4.4
yum -y install gcc-c++
yum -y install npm
npm install -g retire
cd w3af && ./w3af_console
/tmp/w3af_dependency_install.sh
echo "alias w3af='cd /opt/tools/w3af &&./w3af_console'" >> ~/.bashrc
echo "[+] Installing w3af "
#diesearch
cd /opt/tools/
git clone https://github.com/maurosoria/dirsearch
echo "alias dirsearch='cd /opt/tools/dirsearch/ && python3 dirsearch.py'" >> ~/.bashrc 
echo "[+] Installing dirsearch "
#subDomainsBrute
git clone https://github.com/lijiejie/subDomainsBrute
pip install dnspython gevent requests
echo "alias subDomainsBrute='cd /opt/tools/subDomainsBrute && python subDomainsBrute.py'" >> ~/.bashrc 
echo "[+] Installing subDomainsBrute"
#Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git
echo "alias sublist3r='cd /opt/tools/Sublist3r && python sublist3r.py'" >> ~/.bashrc
echo "[+] Installing Sublist3r"
#theHarvester
cd /opt/tools/
git clone https://github.com/laramies/theHarvester
cd theHarvester && python3 -m pip install -r requirements.txt
echo "alias theHarvester='cd /opt/tools/theHarvester && python3 theHarvester.py'" >> ~/.bashrc
source ~/.bashrc
echo "[+] Installing theHarvester"
#sqlmap
git clone https://github.com/sqlmapproject/sqlmap
echo "alias sqlmap='cd /opt/tools/sqlmap && python sqlmap.py'" >> ~/.bashrc
echo "[+] Installing sqlmap"
#bypass_waf
cd /opt/tools
git clone https://github.com/3xp10it/bypass_waf
yum install -y figlet
echo "alias xwaf='cd /opt/tools/bypass_waf && python3 xwaf.py'" >> ~/.bashrc
echo "[+] Installing xwaf"
#tor
yum install -y tor
echo "[+] Installing tor"
#proxychains
cd /opt/tools
yum -y install gcc automake autoconf libtool make
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng && ./configure
make && sudo make install
cp ./src/proxychains.conf /etc/proxychains.conf
cd .. && rm -rf proxychains-ng
#hashid
pip install hashid
echo "[+] hashid"
#hrdra
cd /opt/tools
yum install -y openssl-devel pcre-devel ncpfs-devel postgresql-devel libssh-devel subversion-devel hydra.x86_64
echo "[+] Installing hydra"
#nmap
yum install -y nmap
echo "[+] Installing sqlmap"
#snitch (Google dork)
git clone https://github.com/Smaash/snitch
echo "alias snitch='cd /opt/tools/snitch && python snitch.py'" >> ~/.bashrc
echo "[+] Installing snitch"
#XSStrike
git clone https://github.com/s0md3v/XSStrike
pip install --upgrade pip
pip3 install --upgrade pip
pip3 install selenium requests tld fuzzywuzzy
wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
tar zxvf geckodriver-v0.24.0-linux64.tar.gz
mv geckodriver /usr/local/bin/
rm -rf geckodriver-v0.24.0-linux64.tar.gz
yum -y install firefox
echo "alias xsstrike='cd /opt/tools/XSStrike && python3 xsstrike.py'" >> ~/.bashrc
echo "[+] Installing XSStrike "
#CMSeeK
cd /opt/tools/
git clone https://github.com/Tuhinshubhra/CMSeeK
cd CMSeeK && pip3 install -r requirements.txt
echo "alias cmseek='cd /opt/tools/CMSeeK && python3 cmseek.py'" >> ~/.bashrc
source ~/.bashrc
echo "[+] Installing CMSeeK"
#sqliv
cd /opt/tools/
git clone https://github.com/the-robot/sqliv
pip install bs4 terminaltables termcolor google nyawc
cd sqliv && python setup.py -i 
echo "alias sqliv='cd /opt/tools/sqliv && python sqliv.py'" >> ~/.bashrc
echo "[+] Installing sqliv"
#WAFNinja
cd /opt/tools/
git clone https://github.com/khalilbijjou/WAFNinja && cd WAFNinja
pip install -r requirements.txt
echo "alias wafinja='cd /opt/tools/WAFNinja && python wafninja.py'" >> ~/.bashrc
echo "[+] Installing WAFNinja "
#Wfuzz
pip install wfuzz
echo "[+] Installing Wfuzz "
#Cupp
cd /opt/tools/
git clone https://github.com/Mebus/cupp
echo "alias cupp='cd /opt/tools/cupp && python cupp.py'" >> ~/.bashrc
echo "[+] Installing cupp "
#GitMiner
cd /opt/tools
git clone http://github.com/UnkL4b/GitMiner
cd GitMiner && pip3 install -r requirements.txt
echo "alias gitminer='cd /opt/tools/GitMiner && python3 gitminer-v2.0.py'" >> ~/.bashrc
echo "[+] Installing GitMiner"
#ReconDog
cd /opt/tools/
git clone https://github.com/s0md3v/ReconDog
echo "alias recondog='cd /opt/tools/ReconDog && python dog'" >> ~/.bashrc
source ~/.bashrc
echo "[+] Installing ReconDog"

#cobalt strike
cd /opt/tools/
yum install -y java-1.8.0-openjdk unzip
service iptables stop
wget http://file.hackersb.cn/tools/cobaltstrike.zip && unzip cobaltstrike.zip
rm -rf cobaltstrike.zip
cd cobaltstrike && chmod +x teamserver
systemctl stop firewalld.service
echo "alias cs='cd /opt/tools/cobaltstrike && ./teamserver'" >> ~/.bashrc 
echo "[+] Installing cobalt strike and stop iptables"
source ~/.bashrc
#metasploit
cd /opt/tools/
yum install -y ruby
yum install -y xorg-x11-server-Xvfb
yum clean all
wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run && chmod +x metasploit-latest-linux-x64-installer.run && ./metasploit-latest-linux-x64-installer.run
echo "[+] Installing metasploit"
rm -rf metasploit-latest-linux-x64-installer.run
#openvas
cd /opt/tools/
wget -q -O - http://www.atomicorp.com/installers/atomic |sh
yum upgrade -y
yum install -y openvas
openvas-setup
echo "[+] Installing openvas"
# The End
echo "[+] All tools installed successfully!"
echo "[+] ~~~ Happy Hacking! ~~~"
echo ""
