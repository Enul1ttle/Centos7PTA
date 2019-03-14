＃Centos7PTA
## Centos7.6一键安装常用的渗透工具
### 0x01 系统要求
- 查看系统版本：`cat /etc/redhat-release`
- 查看系统位数：`uname -a`
- 系统升级：`yum update`
>版本过低于**7.5** 会造成nmap,hydra等一些工具不能正常安装
### 0x02 安装内容
- 必备组件：net-tools wget bzip texlive alien guntls-utils git pip httpd zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
- 必备环境：python3 pip3 jdk 1.8
- 信息收集：whois wafw00f whatweb nmap snitch GitMiner ReconDog subDomainsBrute Sublist3r
- 漏洞扫描：Nilto openvas Arachni w3af diesearch  XSStrike CMSeek sqliv 
- 漏洞利用 metasploit sqlmap
- 模糊测试：WAFNinja Wfuzz
- 后渗透工具：nc frp 
### 0x03 代码介绍
`echo "alias xsstrike='cd /opt/tools/XSStrike && python3 xsstrike.py'" >> ~/.bashrc`
#把`cd /opt/tools/XSStrike && python3 xsstrike.py`添加到 /root/.bashrc。
#在命令行输入xsstrike 就能快速启动，觉得命令太长修改`alias xsstrike`即可自定义命令
### 0x04 使用说明
- chmod +x centos7x64.sh && ./centos7x64.sh
- vi ~/.bashrc 可以修改快速启动的命令。
- service httpd start 快速搭建http服务器
- arachni 默认的账号:`admin@admin.admin` 密码：`administrator`
### 0x05 一些问题
- frp 还没配置frps.ini，请设置好后自行添加快速启动 `echo "alias frps='cd /opt/tools/frp_0.24.1_linux_amd64 && ./frps -c ./frps.ini'" >> ~/.bashrc`
- Cobalt strike 需要自行压缩成zip，并把文件上传到 /opt/tools/ 后输入`unzip cobaltstrike.zip && rm -rf cobaltstrike.zip`。使用方法`cs VPSip password`
- metasploit与openvas 未实现全自动化，需要手动确认


