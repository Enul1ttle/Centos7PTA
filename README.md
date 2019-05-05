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
- 漏洞扫描：Nilto openvas Arachni w3af dirsearch  XSStrike CMSeek sqliv 
- 漏洞利用 metasploit sqlmap
- 模糊测试：WAFNinja Wfuzz
- 暴力破解：hydra cupp
- 后渗透工具：nc frp cobaltstrike
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
- 如果没有发现此命令，就执行`source ~/.bashrc` 更新一下快速启动的命令
- Cobalt strike 是在网上乱找的版本http://file.hackersb.cn/tools/cobaltstrike.zip 仅为测试功能完整性。请自行替换掉里面的文件
- metasploit与openvas 未实现全自动化，需要手动确认
- 可能会遇到`AttributeError: 'X509' object has no attribute '_x509'`,解决方法`pip uninstall pyOpenSSL cryptography``pip install pyOpenSSL cryptography`重新安装py0penSSL cryptograhy
### 0x06 渗透工具的介绍与简单使用
https://enul1ttle.github.io/2019/03/14/Centos7%E6%B8%97%E9%80%8F%E5%B7%A5%E5%85%B7%E8%87%AA%E5%8A%A8%E5%8C%96%E5%AE%89%E8%A3%85/
### 0x07 2019/4/18 更新bypass_waf+tor+proxychains
#### xwaf
bypass_waf项目地址：https://github.com/3xp10it/bypass_waf

快速启动命令为xwaf，全自动配合sqlmap绕waf,测试了一下虽然时间很久，但确实能绕。配合tor一起使用，很舒服
#### tor
tor需要配置才能使用

- `vi /etc/tor/toorc`  #取消掉24行SOCKSPort 9050的注释

- `systemctl restart tor` #重启tor

- `netstat -lnt`   # 查看tor 9050 端口是否已经启动
#### proxychains 
默认已经配置好tor的端口了

也可以自行修改`vi /etc/proxychains.conf`
### 0x08 更新theHarvester
收集目标的邮箱和子域名
用法：`theHarvester -d baidu.com -l 30 -b all`

