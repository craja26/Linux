/********* SELINUX ********/
Traditionla Permissions:
	chmod, chown, chgrp
Special Permissions:
	suid, sgid, stickybit
Advanced permission:
	setfacl, getfacl --- discreationary access control

selinux - Secure enhanced linux (Mandotory access)
	file and folders, processes, ports

1. sestatus  (check selinux status)
2. ls -lZ <file>		(to check selinux policy of a file)
3. ls -ldZ <folders>
4. ps -auZ 		<check selinux security)

selinux having two modes
1. enable
	a. enforcing	(security must enforced, ie mandatory)
	b. permissive	(
2. disable

config file: /etc/selinux/config

Note: when you are changing enable to disable or vice versa, system reboot must
	but chaning mode enforcing to permissive or vice versa, system reboot not required.

# sestatus		(check status)
# getenforce	(check current mode)
# vim /etc/selinux/config

Example: Webserver
1. Package: httpd
2. port: 80/443
3. config: file= /etc/httpd/conf/httpd.conf
4. daemod: httpd
5. firewall: http
6. document root: /var/www/html

# sestatus
# getenforce
	enforcing
# touch coss
# ls -lZ coss
# mkdir /custom
# ls -ldZ /custom/

--Design a webpage and:
# yum install httpd -y
# systemctl enable --now httpd		(enable and run)
# systemctl status httpd
# cd /var/www/html
# vim index.html
	This is Raja's webpage
# firewall-cmd --list-all		(listing firewall services)
# firewall-cmd --permanent --add-service=http		(adding service to firewal)
# firewal-cmd --reload
# curl http://serverb.example.com/			(see website content in terminal)
# ls -lZ index.html		(check selinux permissions for index.html)

# mv index.html /var/www/html/
# cd /var/www/html/
# ls
# curl http://server.example.com		(see website contenct in terminal)
	- Get an error message)
# ls -lZ index.html
# getenforce
# setenforce 0		(permissive mode)
# curl http://server.example.com	(now able to see the content)

# setenforce 1		(enforce mode)
# curl http://server.example.com	(now not able to see the content)

# ls -lZ index.html
# chcon -t httpd_sys_contenct_t index.html
# curl http://server.example.com	(now able to see the content)

-- recursively change selinux

-- Example give port level security for port 82
# rpm -qa httpd		(checking package)
# systemctl status httpd
# cat /var/www/html/index.html
# curl http://servera.example.com:82
	Getting an error
# vim /etc/httpd/conf/httpd/conf
	- change port number to 82
		Listen 82
# systemctl restart httpd
# firewal-cmd --list-all
# firewal-cmd --permanent --add-service=http
# firewal-cmd --permanent --add-port=82/tcp					(add port)
# firewal-cmd --reload
# ls -lZ /var/www/html/index.html
# chcon -t httpd_sys_contenct_t /var/www/html/index.html
# man semanage port		(check document and get selinux change port command)
# semanage port -a -t http_port_t -p tcp 82
# systemctl restart httpd
# curl http://servera.example.com:82

# semanage port -l		(search non standard prot)
# semanage port -l | grep ssh
# man semanage port		(check selinux port document)

--
# ls -ldZ /custom
# vim /custom/index.html
	This is Raja webcontent
# ls -lZ /custom/index.html
# vim /etc/httpd/conf/httpd.conf
	(change directory for web root directory like below)
	DocumentRoot "/custom"
	<Directory "/custom">
		AllowOverride None
		# Allow open access:
		Require all granted
	</Directory>
# systemctl restart httpd
# semanage fcontex -a -t httpd_sys_contenct_t '/custom(/.*)?'
# ls -ldZ /custom
# ls -lZ /custom/index.html
# restorecon -Rv /custom			(changing contect inside custom folder)

# seinfo -t | grep http


