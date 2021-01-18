----********* RHEL-8: Exam *********-------

Kernel - will manage all the hardware components also Application services
Modules - loaded and uploaded to Kernel required module
Shell - Interpreter/translator = /bin/bash
terminal - (ex. GNOME)
user - 

Get login user name: #whoami
Get the machine name: # hostname
Get the domain name: # hostname -d
Get home directory: # pwd
Check id of a user: # id root (or) id <username>
Check kernel info : # uname -a
Get date: # date
Check offline help: # man <command> 
	example: # man uname

Add user: # useradd raja
How to identify user: # id raja
* 0 to 1000 ids are reserved for system and application users.

Switching user: su - raja
Get login user: # logname
Current user: # whoami
Exit from user session: $ ctrl+d
Switch to root user: $ su - root (or) $ su - (or) $ sudo -i

Change user password from root: # passwd raja
New password:
retype new password:

Change user password after login: passwd
new password:
retype new password:

Where the user information stored: /etc/passwd

See first 10 lines in a file: # head /etc/passwd
See first n lines of a file: # head -n 15 /etc/passwd
See last 10 lines of a file: # tail /etc/passwd
See last n lines of a file: # tail -n 15 /etc/passwd

Read page by page: more /etc/passwd

Syntax: command	options	arguments
Example:	useradd username
			head -n 15 /etc/passwd

command to lock user: passwd -l raja
command to unlock user: passwd -u raja
How to check whether passwd is locked or not: tail -n -15 /etc/passwd
you can find "!!" at the username line.
How to check whether user password is unlocked: tail -n -15 /etc/passwd
you can see "$number$" at the username line.

Get the word count of a file: # wc /etc/passwd
* copy last argument of previous command: esc . (escape then dot)

How to check a file or directory: #	file /etc/passwd
									file /etc


Open calculator: # bc
Open calendar: # cal
Check failure login attempts: # lastb   (Admin can only run this command)
Check the commands history: # history
If you want to re-execute one of the history command: # !5  (executing 5 command in the history)

Open new terminal: ctrl+shift+t

/********* distributed file system ***********/
#pwd 
/root
List out all files and folders: ll
How many files in Linux OS:
	- = regular file
	d = directory
	c = character file
	b = blk file
	l = linked file
	p = piped file
	s = socket file
	
Explain "ll" results:
	- = regular file
	9 fields = permission for the user(owner of the file), permission of the group owner, permission for others.
	. = Advance permission(acl/adv). If there is any special permission, it going to be +
	1 = number of linked files
	root = file owner
	root = group owner
	6503 =  file size in bytes in memory
	date time	 = timestamp
		 = file name/ folder name

total 16: total number of blocks  for files and hidden files occupied in memory

Check properties of files: # ls -l
Check block used in memory for a file: # ls -as1 original-ks.cfg
Check particular property of a directory:  # ls -ld Music/
Check particular property of a file: # ls -l <filename>

Default file system distributed inside "/": # ls /
Everything is organized in distributed files system under "/".

At the time of installation / and /boot will be created first.

/bin: all the binary executable files stored inside here up to REHL-6
/urs/bin stores binary executable files in REHL-7 and 8

/dev: stores all the device information.
/home: regular user home directory.
/lib64:
/boot: will store boot information.
/media:  all the removable device data.
/mnt: non removable device data(example: download from internet).
/opt: will store optional data or third party software vendor data.
	Third party software vendor data.
	1st party: software with REHL in build
	2nd: (subscription of REHL) 
	3rd: example database software vendor, any third party software vendor.
/proc: Running kernel information.
	it is a virtual directory. Example: cpu, memory, network
/run: run time data for the processes.
	ex: process id,
/sbin: super user system executable commands.
	checking example:	# which useradd
						# which fdisk
/etc: All the configuration files stored inside the etc folder.
/srv: container management, www, .
/tmp: store temporary files. It will automatically get deleted if it is not used for the past 10 days.
/var: frequently changes data(example: mail server data, database, webserver)
/usr: stored all the documentation.(example: frontend code, programs)

/******** Create own files and directory ********/
New terminal: ctrl+shift+t
Create a directory: mkdir <directory name>

Types of directory structure:
	1. Nested directory
		/data
		data1
		data2
	2. Child Level directory
		/world/asia/india
	
Example: 	# mkdir /data
			# mkdir /data/{data1,data2}
List out subdirectories:	# ls -lR /data
							# tree /data

Created subdirectory along with parent directory if parent is not available: 
	# mkdir /world/asia/india -p
If parent directory already existed, create a subdirectory: # mkdir -p /data/data3

Test: create a nested directory like below:
/redhat
|-rhce
|  |-sa3
|-rhcsa
   |-sa1
   |-sa2
   
Answer(check it once you have time):	# mkdir -p /redhat/{rhce/sa3,rhcsa/{sa1,sa2}} 

Test 2: Create nested directory like below:
/linux
|-atc
|	|-advansible
|	|-rhel
|-mmc
|	|-aws
|	|-cka
|	|-ocp
|-ol
	|-devops
	|-op
Answer (test it later on linux machine): mkdir -p /linux/{atc/{advansible,rhel},mmc/{aws,cka,ocp},ol/{devops,op}}
	# tree /linux

Remove a directory: # rm -rf <directory>
	example: # rm -rf /linux/mmc/cks
	If directory is empty you can use rmdir command.
	example: # rmdir <directory>	
reverse search: (control+r)

/****** Create files *******/
1. touch <filename>
	- It always creates an empty file.
	-Example: touch linux
	Create multiple files at a time: # touch coss(1..10).txt
2. cat > <filename>
	- cat > linux2
hello world!
Good morning

save: wq!
	- adding more content to a file.
	- cat >> linux2
	- ctrl+d save file after adding.
	Note: > = overwriting, >> = appending
	- We cannot delete, update using "cat" command.
3. vi, vim, nano, gedit.


/********* Copy and Move *********/
Copy: cp
	replicating backup of original data.
Example:
	create a file: # touch apple
	Add content: # cat > apple
	Hi all
	(ctrl+d) for save
	Copy: # cp apple newapple
	
	If a copy is creating a new file in the same directory, it only creates a new file. If you are copying to a different directory then it will take backup and create a new file.
	copy specific three files to new destination: # cp coss{1.3}.txt /abc
	
	Example: cp -rvpf /abc /data
Test: create 5 mp3 files inside /opt folder. copy a1.mp3 a2.mp3 to /data directory. copy /opt directory to linux
Answer:	# touch /opt/a{1..5}.mp3 
		# ls /opt --listing files
		# cp -rvpf /opt/a{1,2}.mp3 /data
		# ls -ld linux --(checking directory)
		# cp -rvpf /opt/* /linux
	
Move: mv
	-rename or cut and paste
	Example:	# touch apple
				# mv apple pineapple
				# mv pineapple /opt
				
/**** find command ****/
Find - to search in your entire system
grep: search a particular word in a file and display that line.
	- it is a one time search.

Example: How to search a word "root" in /etc/passwd 
	- # grep root /etc/passwd
	Search with number: # grep -n -A 2 <search word> <filename>
	search a line start with linux word: # grep ^linux <filename>
	Search line starts with case incensitive word linux: # grep -i ^linux <filename>
	Search lines excluding a word linux: # grep -v linux <filename>
	Search word count for linux: # grep -ic linux <filename>
	Search line end with "batch": # grep batch$ <filename>
	Search number ranges 10 to 20: # grep 1[0-9] <filename>
Question: Find a string 'ich' from "/usr/share/dict/words" and put it into /root/lines file.
Answer: # grep 'ich' /usr/share/dict/words > /root/lines

/******** vim editor **********/
- Vim is an advanced text editor.
	- user friendly.
	- speed, etc
Modes:
	1. command mode/escmode
		copy = esc + yy (It copies two lines). if you want to copy nlines : esc + nyy 
		past = esc + p 
		undo = esc + u
		redo = ctrl + r 
		search = /<text> 
		set line number = esc + :set nu
		remove the line number = esc + set nonu
		Go to beginning of line = esc + gg
		End of line = esc + shift+g
		Go to specific line: esc + :number
		delete line: esc + ndd
		delete a word: esc + ndw
		delete a char: ctrl +x
		insert mode = esc + i
		search word linux ignore case sensitive: 
			:/linux\c
			(or)
			
		search and replace: esc +:%s /<search word>/<replace word>/gi
		delete number line number 2 to 4: esc + :2,2d
		search "is" in first three lines: esc + :1,2s /is 
		search "training" word in the first three line and replace with "abcdef":  esc + :1,2s /training/abcdef

		Note: refer commands: vimtutor
	2. execution mode/ insert mode
		Search a word with "root" and replace with "root123":
			esc + :%s /root/root123   (it will replace one word in a line if it is more than one root word)
			esc +  :%s /root/root123/g
		above question + replace in the first five lines:
			esc + 1,5s /root/root123/g
		remove line number: esc + :set nonu
		
		Add a line below: esc + o 
		Add line above : esc + O 
		
		open two files at a time in vim: # vim -o file1 file2
		Change cursor to one file to another: esc + 
		quit all files at a time: :qa!
		Open files vertically: # vim -O file1 file2
		
		
	3. exit mode/ save mode
		save and quit: esc + :wq 
		quit: esc + q!

/******** find command *********/	
- It is used for searching/ finding files in your system with some condition.
- # -user, -perm, -empty, -type, -size, -ctime, -mtime.
- search user 
	# find / -user naveen
- search a directory with name "shadow"
	# find / -name shadow -type d  --#It is case sensitive 
	# find / -iname shadow -type d   --# it is case insensitive

-- Each file having unique index/inode number
	- check index/inode number: # ls -il <filename>
	
Esc ww - to switch cursor between multiple files

- Hard Link file: 
	- It is a backup file.
	- Only applied to the files
	- If the original file is deleted there is a backup.
	- Inode number is the same.
	- Difficult to identify.
	- Stored only with in the filesystem
- Softlink file:
	- It is a shortcut file
	- can applied for files and folders
	- If the original file is deleted there is no use of a shortcut file.
	- Inode is different from the original file.
	- Easy to identify.
	- Can store anywhere filesystem
	
- Create Hard Link: # ln <source file> <new file name>
- Create soft link: # ln -s <source file> <new file name>


/******** User Group Management *********/

What is a user? Why do we need a user?
- Every person who logs into a system is a user. Each file and folder is owned by a particular user. Every process is run by a particular user.
- Authorized person to access our system resources. Each user is identified by a unique name.

How many types of users?
- superuser: 
	- id = 0 
	- homedirectory: /root e
	- ecutable commands = /usr/sbin 
	- default shell: /bin/bash

- Normal user:
	- id : starts from 1000
	- homedirectory: /home
	- executable commands = /usr/sbin 
	- default shell: /bin/bash

- System/Network user: 
	- id : starts from 1 to 999, eg: ftp, ldap, samba, nfs

- sudo user: sudo user is a normal user with root privilege.

- Where we can see definitions for all users/logins information?
	- /etc/login.defs 
- Which file stores passwords
	- /etc/shadow
which file stores users list
	- /etc/passwd
- which file stores group 
	- /etc/group
- which file stored group admin
	- /etc/gshadow

- Search for a particular "word" in the above four files.
	- #
- change user shell
	# usermod -s /bin/sh sandeep
- change user default directory
	# usermod -d /guests/sandeep sandeep
	(check user: # grep sandeep /etc/passwd)

- Give comment to user sandeep
	# usermod -c "sysadmin" sandeep
	
Add a user srikanth with uid 6000 gid 1000 comment is "DBA" home directory is "/visitors" shell /bin/sh, password is "wakennym"
	# mkdir /visitors
	# useradd -u 6000 -g 1000 -c "DBA" -d /visitors/srikanth -s /bin/sh srikanth

username: password placeholder: usid: groupid: comment: user home dir: loginshare

- Explain shadow file fields
	- grep vamsi /etc/shadow
	username: encryptedpassword: no.of days last password change(since 1970): Min day: Max day: warning period: inactive days: expire days(-1): future use 
	
	# grep ram /etc/shadow
	- Shadow file encrypted password using different mechanisms. We can find mechanizm name based on the number value specified after the $ symbol.
		$4 = md5
		$5 = sha256
		$6 = sha512  (REHL - 8)
		
- Check account details(example: password expire date, last password change date):
	# chage -l ram

-Change account password properties: minimum date to change, maximum days to change, warning days before password expire.
	# chage -m 2 -M 7 -W 3 -I 2 ram
	# chage -l ram              (checking properties for ram)

- /etc/group : save group information:
	# grep ram /etc/group
	user primary group name: group password placeholder( always pointing to shadow file): group id: comma separated by members
	
- add a group: # groupadd coss
- add user sandeep to newly added group: # useradd -G coss sandeep
- check naveen is a member of how many groups: # groups naveen
- Add multiple members to a group at a time: # gpasswd -M user1, user2, user3, user4 coss
	- disadvantage is, it overwrites existing users.
- add new user to a group: # gpasswd -a naveen coss
- make naveen as admin for coss group: # gpasswd -A naveen coss
- How to remove the group admin account?
	- # gpasswd -A "" coss

/***** sudo user ******/
- Super user doing.
- To get sudo access for a user, we need to add that user in "wheel" group.
	# visudo
	# id <user>
	A user with "wheel" group can use sudo privileges
	
add a user as an admin using a visudo file.
	- Go to "visudo" file, go to line number 21, add new entry for admins.
	- same way you can grant required permissions for a user using visudo

/******* Permissions ********/
- To prevent the access from the unauthorized users we apply permissions to files and folders.
- There are three types of permissions.
	- read  =r =4
	- write =w =2
	- execute =x =1
	Note: when you create a new file, the execute permission is not there.
	If you create a folder you can see execute permission.
	
	- Users in the system categorized into 3 different class
		- Owner/user : who created the file.
		- group: who creates it group: it is its own private or he/she a member of some group.
		- other: neither the owner nor a number of any group.
What is the default permission of a file?
	- default permissions for a file 644 
	- for non-privileged users it is 664.
* Default value is depending on "umask" value
	example: (rwrwrw - umask)
	# umask
	# vim /etc/bashrc
- umask for root is: 022
	umask calculation: using decimal to binary then applying read/write/execute based on result.
	value = binary = r/w/x (Here is 0 position is present, 1 means absent)
	0	= 000	= rwx
	1	= 001	= rw-
	2	= 010	= r-x
	3	= 011	= r--
	4	= 100	= -wx
	5	= 101	= -w-
	6	= 110	= --x
	7	= 111	= ---
	Privileged user: 022(0(users)2(group)2(others)) = rwx rx rx 
	Non-privileged users: 002(users groups others) = rwx rwx rx 
What is the default permission of a folder?
	- 755 for privileged user
	- 775 for non privileged users

How to change permission?
	- syntax: chmod <who><what><which> <filename/folder name>
		chmod ugo +-= rwx <filename/ folder name>

	Example: add write permission for group
		chmod g+w redhat
		ls -l redhat
	Example: grant execute permission for user,group and others.
		chmod ugo+x redhat
	Example: remove execute permission for all(user, group, and others)
		chmod a-x redhat

- Example: write a single command to grant read-write access to user, read-write access to group and no permission for others
	chmod u-x,g+w,o-r redhat
- Example: user=rwx, group=r others= r
	chmod 744 redhat
	* We can use letters or numerical methods. But the numerical method is easy to grant access.

- How to change ownership?
	- chown is the command to change the owner.
	
	- Change owner from root to student
	# chown student redhat
	
	- change group owner to student
	# chgrp student redhat
	
	- change ownership and group ownership to root
	# chown root:root redhat
	
	- change group owner to dba
	# chown :dba redhat
	
	- change data directory group owner to dba for folder and subdirectories
	# chgrp -R dba /data
	
* regular users cannot run "chown", admin can only run.

Question: create a directory in /home called storage change the group ownership of storage directory to manufacture. Let the permission of storage allow the group member to create and delete the files and storage not allow others for accessing its files.
	- # mkdir /home/storage
	- # ls -ld /home/storage	(checking permissions)
	- # groupadd manufacture
	- # chgrp manufacture /home/storage
	- # ls -ld /home/storage	(checking permissions)
	- # chmod g+w /home/storage
	- # chmod 770 /home/storage
	- # ls -ld /home/storage	(checking permissions)
	
/******* special permission *******/
- There are three types of special permissions.
	- suid: defined as giving temporary permission to run a program file with the permission of the file owner rather than the user who runs it.
		# chmod u+s <filename> numeric value=4
		
		Example: check special permissions for below files. You can find "s" instead "x" in the permissions.
			ls -l /usr/bin/su
			ls -l /usr/bin/passwd
		- Find all files having suid permission.
			# find / -perm /u+s
		- grant special permission using numerical values
			# chmod 4755 <filename>
	- sgid : set on directories to allow files and subdirectories inside that directories automatically inherit the directories group ownership to future files and folders.
		- syntax: chmod g+s <foldername> numerical value =2
		Example: create a directory google
			# mkdir -pv /google
			# groupadd manager
			# useradd -G manager max
			# useradd -G manager dax
			# ls -ld /google/		(checking permissions)
			# chmod g+w /google/
			# ls -ld /google/		(checking permissions)
			# su - dax		(change user login to dax)
			# cd /google/
				Permissions denied error
			# chown :manager /google/
			# su - dax		(change user login to dax)
			# cd /google/
				dax can able to access
			
			
	- sticky bit: users with write permission on their directory, can remove the file they own. They cannot remove/modify for the other users. It is always applied to the folder.
		- syntax: chmod o+t <folder> numerical value 1
		Example: # chmod o+t /google/
			# ls -ld /google/
		

/****** AC = access control list *******/
- fine grain policy for each user and group.
	# ls -l <file>
	+(plus is replaced .) --> There is an extended permission on that particular file or folder.
	
	- setfacl: apply or modify acl permission
	- getfacl: check the acl permission
		- options:
			-m = modify or set acl
			-b = remove all acl permission
			-x = remove individual acl permissions
			-R = recursively set the acl permission
			-d = set default acl setting
			-k = remove default acl setting.
	- example:	# setfacl -m u:student:rwx redhat
				or
				# setfacl -m u:student:7 redhat
			- check the permissions:
				# ls -l redhat
				# getfacl redhat
	- Example for directories:
		# mkdir /manager
		# setfacl -m u:student:rwx /manager/
		# getfacl /manager/
		
What is a mask?
- The highest level permission applied on the files and folders.

Question: - Copy the file /etc/fstab to /var/tmp/ and configure the "ACL" as mention following
	- The file /var/tmp/fstab should owned by the "root"
	- The file /var/tmp/fstab should belongs to the group "root"
	- The user "sarah" should be able to read and write to the file.
	- The user "harry" can neither read nor write to the file.
	- Other users (future and current) should be able to read /var/tmp/fstab.
Answer: # cp -rvpf /ect/fstab /var/tmp/
	# ls -l /var/tmp/fstab
	# useradd sarah
	# setfacl -m u:sarah:rw /var/tmp/fstab    or setfacl -m u:sarah:6 /var/tmp/fstab
	# useradd harry
	# setfacl -m u:harry:--- /var/tmp/fstab
	# setfacl -m o::4 /var/tmp/fstab
	# getfacl /var/tmp/fstab
	

/******* Process Management ********/
- Program under execution is called process.
- A specific instance of running a program is called process.
- unique process id = pid
What is the first process running REHL-8?
	- systemd (RHEL-7/8 - systemd)
	- upto RHEL-6 init is the first process.

1. Parent process(parent process id): ppid
	- check all terminal process:
		# ps -a
	- process id stored /run (need to check again)
	- list out all the terminal process
		# ps -aux
	- how to check which process is running background and foreground.
		# ps -aux
			if any process showing TTY value as question mark"?" then those are running background.
	- check parent id
		# ps -ef or ps -lax
	
2. Child process: 

- State of the process:
	- running
	- started
	- stopped
	- zombie
	- orphan
	- sleeping
	- waiting

- signal: operating systems communicate with the processes through signal.
	- There are 64 signals available.
- If you kill the session with signal number 9, it will generate an orphan process.
	# kill -9 pid

- check processes with parent process id
	# ps -ef
	# ps -lax
- ps with options
	- first ten lines: # ps -e | head
	- cpu, pid, and command: # ps -eo %cpu,pid,comma
	
	- search particular user in process: # ps -eo pid,comm,user | grep student
	- check pid for particular process: # ps -C cat -o pid=
	- check the process name using pid: # ps -p 1488 -o comm=
	- how to kill a process without knowing pid: # pkill cat 

- Virtual memory:

-Nice value: The priority of the process is inversionally proportional to nice value.
	- change nice value
		# renice -n -12 1506   (1506 is pid)
	- nice value range =(-20 to +19)
- Priority:


-top
-top -u student (get real time processes for student user.)
- check highest memory consuming process
	# top
		shift+m


/******* systemctl *********/

-Daemons are processes that either wait or run in the background, perform various tasks.
-systemctl
	- how to know whether a package is installed or not?
		- rpm -qa httpd  (httpd is software) -to verify package is installed or not, -qa means query all. (or) - yum list installed httpd
		- rpm -qa openssh-server  (openssh-server)
		- systemctl status openssh-server
	- enable a service( across the reboot service will automatically run)
		systemctl enable httpd
	- 
	- start service
		- systemctl start <service name>
	- stop service
		- systemctl stop <service name>
	- restart service
		- systemctl restart <service name>
	- single command to enable service and start.
		- systemctl enable --now <service name>
	- reload service
		- systemctl reload <service name>
	
- mask: 
	- systemctl mask httpd
	-check status after masking
		- systemctl status httpd  (you cannot run/stop service manually when a service is masked.)
	- unmask service
		- systemctl unmask httpd

- check all services status
	- systemctl list-units --type=service --all
- check particular service status
	- systemctl list-units --type=service --all | grep <service name>

/****** ssh (secure shell) ******/
-pkg = openssh-server, openssh-clients must be installed
- check packages are installed or not
	-# rpm -qa openssh-server
	-# rpm -qa openssh-clients
- default port number for ssh is 22
- configuration file is /etc/ssh/sshd_config
- daemon running in the background sshd.service
- service should be added to the firewall
- connect remote machine
	1- # ssh root@servera
		- it will ask authentication.
		- enter password
	2- # ssh root@serverb.lab.example.com  (ssh remote_user_name@fully qualified domain name)
	3- # ssh root@ip_address
- 
- first time it will ask for an authentication message, but not ask for next time onwards.	
- .ssh/know_hosts file contains logged login user information. that is the reason it won't ask authentication from next time.

-* key based(passwordless) authentication: required two keys
	- private key
	- public key
- how to generate ssh key
	- first check ssh key: # ls .ssh
	- generate key: # ssh-keygen  (it will generate unique state key. It uses RSA algorithm )
		hit enter enter enter
		It will key files in .ssh directory
		# ls .ssh
			config	id_rsa id_rsa.pub know_hosts
				- here "id_rsa.pub" is public key and "id_rsa" private key
		
	- share this key to target server
		- share key to remote host: # ssh-copy-id root@servera 
			It will ask you for a password for private key verification.
		- next time onwards it won't ask for a password.
	- where the keys are stored in the target machine.
		- # ls .ssh
			authorized_keys.
		- check keys
			# cat .ssh/authorized_keys
- If the remote machine user password changed, would it ask for a password for remote login.
	- No, it won't ask for a password even after changing password on target machine. It always checks the key on the target(remote) machine and source machine.
	- Until the key is matching it doesn't ask for a password.

- restrict settings to not grant root access.
	# vim /etc/ssh/sshd_config
		- change PermitRootLogin no  ( replace yes with no)(might be at line number 46)
		- then we have to restart service with 
			# systemctl restart sshd
			
- stop access for all the users.
	- # vim /etc/ssh/sshd_config
		- change "PasswordAuthentication no" then restart daemon.
		
- Deny users.
	- # vim /etc/ssh/sshd_config
		- add an entry like below then save file.
			DenyUsers <username1>,<username2>,<username3>
	- # systemctl restart sshd
- Deny groups.
	- # vim /etc/ssh/sshd_config
		- add an entry like below then save file.
			DenyGroups <group1>,<group2>,<group3>
		- # systemctl restart sshd
- Allow users.
	- # vim /etc/ssh/sshd_config
		- add an entry like below then save file.
			AllowUsers <username1>,<username2>,<username3>
	- # systemctl restart sshd

/******* Network ********/
- a group of computers connected with each other through a network device.
- starts communication with each other it is called networking.
- physical requirement:
	- NIC card - ethernet
	- jack
	- cable
	- switch
	- ports
	- routers
- logical requirements:
	- IP
	- dns
	- gateway
	- netmasking/subnetting
	- hostname

- OSI model(7 layer)= PDNTSPA   (old model)
	- physical layer 
	- data link layer
	- network layer
	- transport layer
	- session layer
	- presentation layer
	- application layer

- tcp/ip model(4 layers)      (new model)
	- link layer
	- network layer
	- transport layer
	- application layer
- ip address = ISP = ipv4/ipv6
IANA - internet assigned number authority
ipv4 = 32 bits (0-255) = 4 octet = 8*4
ipv6 = 128bits = (16*8)
	- classA (range): 1-126 = default netmasking value = 255.0.0.0 = /8
	- classB (range): 128-191 = 255.255.0.0 = /16
	- classC (range): 192-223 = 255.255.255.0 = /24
	- classD (range): 224-239  -- classD&E are mostly for department of defence or research = 255.255.255.255 = /32
	
	- classE (range): 240-254
- 32bit = 8*4
	255 = 1+2+4+8+16+32+64+124 (0-7)
ethernet card/ nic card/ physical/ mac = 48bits = (6*8)

class	nmlength	no. of nws	hosts			nm
A		8			126			16,777,214		255.0.0.0
B		8			16,382		65534			255.255.0.0

- missing ip in the above class 
	- 0 = using for netmasking.
	- 127 = loopback ip (it is use for testing connectivity for nic card ), it is stored in /etc/hosts
	- 255 = using for netmasking. 
		Netmasking: cidr common inter domain routing.
- # ifconfig or # ip a

Example calculation: suppose I purchased below ip
	Host address classC 192.168.1.107	= 11000000.10101000.00000001.01101011
	Network prefix		255.255.255.0 	= 11111111.11111111.11111111.00000000
	Network address 	192.168.1.0		= 11000000.10101000.00000001.00000000
	Broadcast address	192.168.1.255	= 11000000.10101000.00000001.11111111
	minimum ip = network address + 1	= 192.168.1.1
	maximum ip = broadcast address -1	= 192.168.1.254

Example:
	host address classA 10.1.1.18 =  
	network prefix /8 255.0.0.0   =
	network address		10.0.0.0			= 00001010.00000000.00000000.00000000
	broadcast address	10.255.255.255		= 00001010.11111111.11111111.11111111
	minimum ip = network address + 1 = 10.0.0.1
	maximum ip = broadcast address -1 = 10.255.255.254

Example:
	Host address	172.168.181.23			= 10101100.10101000.10110101.00010111
	Network prefix /19 (255.255.224.0)		= 11111111.11111111.11100000.00000000
	network address	 172.168.160.0			= 10101100.10101000.10100000.00000000
	broadcast address	172.168.191.255		= 10101100.10101000.10111111.11111111
	minimum ip = network address + 1	= 172.168.160.1
	maximum ip = broadcast address - 1	= 172.168.191.254
	
- Large scale companies are buying classA ip address as they can get more ip addresses
-

- Formula
	- Number of networks classA		= 2^(netmask length- number of used segments) - 2 = 2^(8-1) - 2 = 128-2 = 126
						 classB		= 2^(16-2) - 2
						 classC		= 2^(24-3) -2
	- Number of hosts	= 2^(number of zero) - 2
				ClassA	= 2^24 - 2 = 
				ClassB	= 2^16 - 2 =
				ClassC	= 2^8 - 2  = 256-2 = 254

- # ip a
	- loop backup ip: 127.0.0.1/8
	- enpls0:
	- link/ether: mac address: 
	- ipv4 ip address:
		example: 172.25.250.10/24  here 24 is netmasking.
	- gateway 
		how to check default gateway
			# ip route    ("netstat -r"  is old command 
	- 
-DNS: domain name server
	- default port number: 53
	- Name server details available at /etc/resolv.conf
	- How to check dns 
		# dig -x ip address (or) nslookup ip address/hostname

- Configure network manually
	-check connection
			# nmcli connection show
	- static: we have two methods
		1. nmcli(network manager command line interface.): 
			# nmcli connection add con-name coss ifname enp1s0 type ethernet			(here coss is network name)
			#nmcli connection show
			# cat /etc/sysconfig/network-scripts/ifcfg-coss
			- add ip address
			# nmcli connection modify coss ipv4.addresses 172.25.250.10/24 ipv4.172.25.250.254 ipv4.dns 172.25.254.254 ipv4.dns-search lab.example.com ipv4.method static
			
			-check entries
			# cat /etc/sysconfig/network-scripts/ifcfg-coss
			# nmcli connection show
			# nmcli connection up coss
			
			
		2. nmtui (network manager text user interface.
			# nmtli
				- edit
					- Ethernet
						- Add required details and save it.
						
- Practice:			
		- # hostnamectl  (check host details)
		- # hostnamectl set-hostname servera.lab.example.com		(set static hostname)
		- # nmcli connection modify "Wired connection 1" ipv4.addresses 172.25.250.10/24 ipv4.dns 172.25.254.254 ipv4.gateway 172.25.254.254 ipv4.dns-search lab.example.com ipv4.method static
		- # nmcli connection modify "Wired connection 1" ipv4.dns-search lab.example.com
		- # nmcli connection up "Wired connection 1"
	- Add new connection:
		- # nmcli connection add con-name redhat type ethernet ifname enp1s0
		- # nmcli connection modify redhat ipv4.addresses 10.0.0.10/18 ipv4.gateway 10.0.0.254 ipv4.method static 
		- # nmcli connection up redhat
		- # vim /etc/sysconfig/network-scripts/ifcfg-redhat
			- verify ONBOOT values. It should be yes to get an active connection after reboot.
		
Note: on a single device(enp1s0) you can add multiple connections at a time. only one connection is active.
		
	- dynamic(dhcp):


/******* Archiving and compression *******/
- tar: tape archiving = collection with reduction
- gzip, bzip2, xz --- compression tools
- gunzip, bunzip2, unxz ---- uncompression tool.
- create a tar file: "-c"
- how to read content of the compressed file: -t = to list the tar files content
- -x = extract the tar file contents
- -f = to specify the file name
- -c = verbosity
- -z = to compress with gzip tool
- -j = to compress with bzip2
- -J =  to compress with xz tool

- How to check size?
	- # du -sh /etc
- create a tar file for /etc.
	- # tar -cvf /root/coss.tar /etc
	- # du -sh coss.tar    (check file size)
- zip/compress file using gzip compression tool
	- # gzip coss.tar
	- # du -sh coss.tar.gz

- gz: data writing is high compression is low.
- bz2: data writing is low but compression high
- xz: both writing and compression is high

- uncompression:
	- # gunzip coss.tar.gz

- compress and uncompress with bzip2 and xz
	- # bzip2 coss.tar  (compress using bzip2)
	- # bunzip2 coss.tar.bz2  (uncompression)
	
	- # xz coss.tar     (compress using xz)
	- # unxz coss.tar.xz
	
- create a gzip
	-using gzip
	- # tar -czf /opt/raja_var.tar.gz /var
	- # ls /opt
	- # du -sh /opt/raja_var.tar.gz
	
	-using bunzip2
	- # tar -cjf naveen.tar.bz2 /var
	
Question: create an archive '/var/tmp/backup.tar.bz2' of /usr/local directory and compress it with bzip2.
Answer:	- # du -sh /usr/local
		- # tar -cjf /var/tmp/backup.tar.bz2 /usr/local
		- # du -sh /var/tmp/backup.tar.bz2
Example:
- Add a new file(mysql_log.txt) to a compressed file(raja_var.tar.gz)
	- First need to unzip the existing zip file
		# gunzip raja_var.tar.gz
		# ls
	- Add file to tar file
		# tar -f raja_var.tar --update mysql_log.txt
		# gzip raja_var.tar
		# tar -tf raja_var.tar.gz    (list the files in zip file)
		Note: we can also delete a file from zip file in the same way.
- Extract files from zip file
	- # tar -xf raja_var.tar.gz
	- # ls

/******** scp *********/
- # scp raja.tar.gz raja@serverc:
	- scp comes with openssh-server, openssh-clients
- check absolute path of scp command
	- # which scp
		/usr/bin/scp
- check scp rpm package
	- # rpm qf /usr/bin/scp
		openssh-clients-7...........
	- # yum whatprovides /usr/bin/scp

- copy file from remote machine to local
	- # scp root@serverc:/root/raja_var.tar.gz .
	- # ls

/******* rsync (remote synchronization) ********/
- It will synchronize files between source and destination
	- # rsync  raja_var.tar.gz root@servera:/opt
	


/********** Package management ***********/
- nothing but a software
- it contains some configuration files, library files, modules(from RHEL-8), documents, document root etc.
- There are two tools to manage packages
	- rpm: redhat package manager
	- yum: yellowdog updater modifier
- utility server contains all the required softwares

- download a package
	- # wget http://path..............

- verify package whether installed or not.
	- # rpm -qa <package name/software>
	- # rpm -qa tree
	
- each package consists four parts
	- package name
	- version
	- release
	- architecture support details
- query information about a package
	- # rpm -qi tree
	
- check configuration settings
	- # rpm -qc openssh-server

- check documentation
	- # rpm -qd openssh-server

- list out all the files
	- # rpm -ql openssh-server

- remove a package 
	- # rpm -e tree   (-e means erase)

- install a package  (-i install, v visibility, h process) using image file- rpm
	- download iso image
		- # wget http://...............
	- mount iso image file
		- # mkdir /raja
		- # mount rehl-8.0......iso /sandeep/
		- # ls /sandeep/
			(FYI... BaseOS: provides core package content, AppStream: various application streams available here)
		- # cd /sandeep/BaseOS
		- # cd Packages/
		- # ls
	- install package
		- # rpm -ivh zsh-5.5.....x86_64.rpm  
			Note: "yum" always looks for the latest software. So, no need to provide a full package path but "rpm" needs a specific path and not look for latest packages.
		- # rpm -qa zsh (checking package whether installed or not)

- install a package without dependencies.
	- # rpm -ivh zlib-1.2XXXX.rpm --nodeps
		Note: without dependencies you may face issues while using the application.
	
- ls, pwd, head, cat, tail comes from the "coreutils" package.
- coreutils package comes from baseOS packages.

- ***yum ***
- yum is always taking latest package from repository and resolve dependency first
- example 
	- # yum install <package name>

- list installed packages
	- # yum list installed coreutils
- check information about package
	- # yum info coreutils
- remove package
	- # yum remove <package>

- install group of packages
	- # yum group install <package>
- yum package information
	- # yum whatprovides /usr/bin/scp
- yum history
	- # yum history
	- # yum history info 6
- remove package using history
	- # yum history
	- # yum history undo 6 
- list repository
	- # yum repolist
	
- remove repository
	- # rm -rf /etc/yum.repos.d/*
- create a yum repository
	- # vim /etc/yum.repos.d/coss.repo
		[ex124]
		name=BaseOS
		baseurl=http://BaseOS_url/BaseOS
		enabled=1
		gpgcheck=0
		[ex134]
		name=AppStream
		baseurl=http://anotherURL/AppStream
		enabled=1
		gpgcheck=0
	:wq!
	- # yum repolist
	
- Managing Package Module Streams
- Check modules list
	- # yum modules list
	- # yum module list perl
- information about module
	- # yum module info perl
- check information about specific version
	- # yum module info --profile perl:5.24
- install specific module
	- # yum module install perl
- check package is installed or not
	- # yum module list perl
- disable a module
	- # yum module disable perl
- remove a module
	- # yum module remove perl

- search specific package
	- # yum module info python36
	- # yum module list | grep python
	
- install python36
	- # yum module install python36:3.6/common
	or
	- # yum module install @python36


/******* Partition ********/
- Storage: 
	1. Directly attached storage
	2. Network attached storage
	3. Storage area network

- Managing physical storage:
	1. Each partition contains file system
	2. a raw data space
	3. a swap space

a. SATA disc(/dev/sda, /dev/sdb)
b. IDE disc(/dev/hda, /dev/hdb)
c. Virtual disk(/dev/vda, /dev/vdb)

- Identify storage: 
	# fdisk -l
	# parted -l
- What is /dev/vda1 = 1st virtual disk 1st partition
- /dev/vdb3 = 2nd virtual disk 3rd partition

- There are two types of partition schemes
	1. MBR/DOS/BIOS partition scheme
		DOS: you can create maximum 4 primary partition. One out of four partition, we can make it extended partition.
			you can create logical partition on extended partition. Extended partition never be formatted.
		MBR: Master boot record: first sector of hard disk.= 512 bytes
			446 = IPL, 64 bytes = PTI, 2 bytes = Magic no.
		- Create 100MB of partition
			- # parterd -l
			- add a primary partition
				- # fdisk /dev/vdb
					: m
					: n
					: p
					: 1
					:  (enter)
					: +100M
					: p
					: w
			- update partition table information.
				- # partprobe
			- format the device
				- # ls -l /dev/vdb1
				- # mkfs.ext3 /dev/vdb1   (formating file system)
			- check it is formated or not
				- # blkid /dev/vdb1
			- create a mount point point
				- # mkdir /storage
			- mount it
				- # mount /dev/vdb1 /mnt  (temporary mount)
				- temporary mount info stored in /etc/mtab
				- # /etc/mtab
			- df -hT
			Note: in this a temporary mounting. Once server is rebooted, it is unmounted. We have to attach drive again.
			- remount after reboot
				- # mount /dev/vdb1 /mnt
				
Question: Create a 1GB partition in the 2nd virtual disk 3rd partition?
Answer: /dev/vdb3 
	- # fdisk -l
	- # fdisk /dev/vdb 
		: p (existing checking partitions)
		: n (add new partition)
		:   ( if you don't give anything it will take it as a primary partition)
		: 3 ()
		:   (press enter)
		: +1G
		: p
		:w  (save)
		# partprobe  (update partition table information)
		# lsblk ( check)
		# lsblk  -fp   (check with full path)
		# mkfs -t xfs /dev/vdb3     (format )
		# lsblk  -fp   (check with full path)
		# mkdir /data  (CREATE mount point)
		# mount /dev/vdb3  /data (mount temporary)
		# df -hT
		or
		# lsblk  -fp   (check with full path)
		-- mount perminantly
		# unmount /data   (first unmount temporary mount)
		# blkid /dev/vdb3  (just copy UUID to mount perminantly)
		# vim /etc/fstab   
			- go last line, take new line and add UUID and other details like below then save it.
			UUID="Copy UUID copied in the above step."	/data	xfs	defaults	0	0
		# systemctl daemon-reload   (Don't reboot, run this command.)
		# mount -a
		# df -hT
	-- Troubleshoot if you got any error while running "mount -a" (don't reboot your machine if you got any issue.)
		- you have to fix the issue, if you restart machine. It will start with maintenance mode.
		# mount -o remount,rw /
		# mount -a   (check the error message)
		# vim /etc/fstab
			(comment this errored line)
		# systemctl daemon-reload
		# reboot (reboot machine)
	-- a disk and formated but not yet mounted. mount this in /storage
		# mkdir /storage
		# lsblk -fp
			or
		# blkid
			-- copy UUID
		# vim /etc/fstab
			UUID="add copied UUID"	/storage	ext3	defaults 0 0 
			(Note: here third field is file system)
		# systemctl daemon-reload
		# mount -a
		# df -hT

- resize is not possible in normal partition.
- naming convention is not there.

-- LVM (Logical Volume manager):
	- Use entire store and create 100MB primary partition and 100MB logical partition
		# fdisk -l
		# fdisk /dev/vdb
			: p
			: n
			: p
			: 1
			: +100M
			: n
			: e (entended partition)
			:
			:
			: +3G
			: p
			: n
			: l
			:
			: +100M
			: p
			: t   (changing the partition type)
			: 1
			: 8e
			: l (get code.)
			: n
			: p
			:
			: +1G
			: p
			: w
		# partprobe ( don't format disk, create physical Volume)
		# pvs (checking physical Volume
		# pvcreate /dev/vdb{1,5}
		# pvs
		# vgcreate       ( Volume group, )
		# vgcreate redhatvg /dev/vdb{1,5}
		# pvs
		# vgs
		# vgdisplay
		# lvcreate -n fedora -l 10 redhatvg
		# lvdisplay (check lvm path)
		# mkfs.ext3 /dev/redhatvg/fedora    (format lv path, copy LV path from lvdisplay command)
		# mkdir /secret
		# blkid /dev/redhatvg/fedora
		# vim /etc/fstab
			-Add line like below.
				UUID= "UUID of new disk"	/secret	ext3 defaults 0 0
		# systemctl daemon-reload
		# mount -a
		# df -hT
Question: Create a logical Volume and mount it permanently.
	- create the logical volume with the name "wshare" by using 50PE's from the volume group "wgroup".
	- Consider each PE size of volume group as "8MB"
	- Mount it on /mnt/wshare with file system vfat.
Answer: #lvname= wshare, vgname = wgroup, pesize=8MB, -l=50, mntpt=/mnt/wshare, fs=vfat, (pe+2)*pesize = 416M(partition calculation)
	# fdisk /dev/vdb
		: n (new partition)
		: p (primary partition)
		: 1
		:
		: +416M
		: t
		: 8e
		: p
		: w
	# partprobe
	# pvcreate /dev/vdb1
	# pvs
	# vgcreate -s 8M wgroup /dev/vdb1
	# vgdisplay
	# lvcreate -n wshare -l 50 wgroup
	# lvdisplay
	# mkfs.vfat  /dev/wgroup/wshare   (format drive as vfat)
	# blkid /dev/wgroup/wshare   (mount it)
	# mkdir /mnt/wshare
	# vim /etc/fstab
		--add line blow or you can also use UUID instead path in the below line
		/dev/wgroup/wshare	/mnt/wshare vfat defaults	0	0
	# systemctl daemon-reload
	# mount -a
	# df -hT
	
-- Remove LV and VG
	# lvremove /dev/redhatvg/fedora
		: y 
	# vgremove redhatvg
	# pvs
	
	
		

	
		
Note: physical Volume divided into smaller chunks, i.e. default is 4MB.	
	
-- Extend logical volume
	- Note: -l (physical extent, -L (actual size)
	# lvextend -L +10M /dev/volgrp/fedora   (if given value is not divided by PE value then it will extend number match with next PE value
	# vgdisplay
	
	# lvextend -l +4 /dev/volgrp/fedora
	# vgdisplay
	
	# lvextend -l 20 /dev/volgrp/fedora
	# vgdisplay
	
	# lvextend -L 170M /dev/volgrp/fedora
	# vgdisplay
	
	# lvextend -l +50%free /dev/volgrp/fedora
	# vgdisplay
	
	# lvextend -l +100%free /dev/volgrp/fedora
	# vgdisplay
	
-- check which file system is formated
	# lsblk -fp
	
Question: Resize a logical volume
	- Resize the logical volume "mvlv" so that after reboot size should be in between 200MB to 300MB.
Answer:
	# fdisk -l
	# lvdisplay
	# vgs 		(checking available space)
	# blkid /dev/myvg/mylv        (checking file system format)
	# df -hT
	# lvextend -L +100M /dev/myvg/mylv
	# resize2fs /dev/myvg/mylv
	
Question: Create a logical volume and mount it permanently
	- Create the logical volume with name "fedora" by using 20PE's from the volume group "redhat".
	- Consider each PE size of volume group as "32MB"
	- Mount it on /mnt/secret with file system xfs.
Answer: --vgname= redhat, lvname= fedora, fs=xfs, mountpt= /mnt/secret, pesize= 32, pe's=20, (pe+2)*pesize = (20+2)*32 = 704
	# fdisk /dev/vdb
		: p
		: n
		: p
		:
		: +704M
		: t
		: 8e
		: p
		: w
	# partprobe
	# pvcreate /dev/vdb3
	# vgcreate -s 32M redhat /dev/vdb3
	# vgdisplay
	# lvcreate -n fedora -l 20 redhat
	# lvdisplay
	# mkfs.xfs /dev/redhat/fedora
	# mkdir /mnt/secret
	# blkid /dev/redhat/fedora
	# vim /etc/fstab  (add new line at the end)
		UUID="UUID value" /mnt/secret xfs defaults 0 0
	# systemctl daemon-reload
	# mount -a
	# vgdisplay
	
- Extend xfs file system
	# lvextend -l +1 /dev/redhat/fedora
	# df -hT
	# xfs_growfs /mnt/secret
	

- # df -hT

	2. GPT/UEFI partition scheme  ( you can add drive upt 8 Zigabites)
	
- 1kb=1024byte
- 1mb = 1024kb
- 1gb = 1024mb
- 1Mib = (2^10)*2byte
	
-Parted command
	# parted -l   (check the available space)
	# parted /dev/vdb mklabel msdos
	# parted -l
	# parted /dev/vdb
		mkpart
		p       (or primary)
		name of partition
		xfs
	start?	2048
	end: 1001MB
		q 
	# parted /dev/vdb print
	# udevadm settle
	# mkfs.xfs /dev/vdb1
	# mkdir /archieve
	# lsblk --fs /dev/vdb
	# vim /etc/fstab
		UUID="UUID value" /archieve xfs defaults 0 0
	# systemctl daemon-reload
	# mount -a
	# df -hT
	

-- Swap partition: 
-- Swap memory:

Question: Add a swap partition of 512MB and mount it permanently.
Answer:	# fdisk -l /dev/vdb
			: n 
			: p 
			:
			: +512M 
			: l 
			: t 
			: 4
			: 82
			:p 
			:w
		# partprobe
		# mkswap /dev/vdb4
		# vim /etc/fstab
			UUID=""		swap swap defaults 0 0
		# systemctl daemon-reload
		# swapon -a
		# free -m
		
		#lsblk 
		
Answer2: # parted -l
		# parent /dev/vdb
			mkpart
			primary
			linux-swap
			1599     (start meaning is ending number for last partition size)
			2112
			p
			rm 3  (removing 3rd partition as we created new partition. So, will remove and create a extended partition)
			mkpart
			extended
			1599
			3584
			print free
			mkpart
			logical
			linux-swap
			1599
			2136
			I
			p
			q
		# udevadm settle
		# 
		#
		#



/******** Network storage **********/
Server: Anythin gin the system is used for sharing.
ipaddress: dhcp server, db: database server, storage: SAN server, files: file server.
client: who is receiving 
prerequisites for Network file server(NFS):
package: nfs, nfs-utils
port no: 2049
daemon: nfs-server
nfs is not secure: rpc protocol (untrusted protocol)
make nfs secure: kerberoes nfs-secure (user level)
nfs doesn't support corss platform.
service need to add on firewall: nfs, mountd, rpc-bind

Configure NFS server:
# yum install nfs* -y
share a directory example:
# mkdir /common
# touch /common/coss{1..10}.txt
# vim /etc/exports
/common	serverd.example.com(ro)
/common	172.25.250.10(rw)
wq!
# systemctl restart nfs-server.service
# exportfs -rvf
Go to client machine (ex: 172.25.250.10
# showmount -e serverc		(check the accessibility)
	you can find firewall issue. Go to serverc and check firewall
serverc # firewall-cmd --list-all
		# firewall-cmd --perminant --add-service=nfs
		# firewall-cmd --reload
		# firewall-cmd --list-all
		# firewall-cmd --perminant --add-service=mountd
		# firewall-cmd --perminant --add-service=rpc-bind
		# firewall-cmd --reload
		# firewall-cmd --list-all
Go to client machine check
	# showmount -e serverc

Temporary mount of nfs:
	# mount -t nfs serverc:/common /mnt
	# df -hT
	
Permanent mount of nfs:
	# showmount -e 172.25.250.12
	# mkdir /storage
	# vim /etc/fstab
		serverc:/common		/storage	nfs		defaults	0	0
	# systemctl daemon-reload
	# mount -a
	# df -hT
Note: file permission is also importent if you want to write anything.

Auto mounting: RHEL offers an alternative way of mounting and unmounting as NFS file system during runtime and system reboots and it is referred to as the AutoFS(Auto File System) service. AutoFS is a client-side service, which is used to mount an NFS file system on-demand.
	1. direct mounting
	2. indirect mounting
	
indirect mounting: # yum install autofs -y
		# systemctl status autofs
		# systemctl enable --now autofs				(start and enable)
		# systemctl status autofs
		# showmount -e serverc
		# vim /etc/auto.master
			shift+g (then add below line or under +auto.master)
			/share		/etc/auto.misc
		:wq!
		# vim /etc/auto.misc
			redhat		-rw,fstyoe=nfs		serverc:/common
		:wq!
		# systemctl restart autofs
		# df -hT
		# cd /share
		# ls
		# cd redhat
		# ls

Direct mounting:
	# rpm -qa autofs
	# yum install autofs -y
	# systemctl enable --now autofs
	# vim /etc/auto.master
		/- /etc/auto.misc
	# vim /etc/auto.misc
		/share		-fstype=nfs,rw		serverc:/common
	# systemctl restart autofs
	# df -hT
	# cd /share
	# ls

ldap used auto mounting:
-----------------------
	# yum install autofs -y
	# systemctl enable --now autofs
	# vim /etc/auto.master
		/home/guest		/etc/auto.misc
	# vim /etec/auto.misc
		ldapuser5		-rw,fstype=nfs		servername.example.com:/home/guests/ldapuser5
		*				-rw,fstype=nfs		servername.example.com:/home/guests/&			#(this is for all users)
	# systemctl restart autofs
	# su - ldapuser5
	# pwd
	


/********* SELINUX ********/
Traditionla Permissions:
	chmod, chown, chgrp
Special Permissions:
	suid, sgid, stickybit
Advanced permission:
	setfacl, getfacl --- discreationary access control

selinux - Secure enhanced linux (Mandotory access)
	file and folders, processes, ports

1. sestatus  (check selinux status)
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
4. daemon: httpd
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

----------------------------------------------
/******** Booting Process *********/
Question: Reset root user password and make it 'trootent'
# Booting Process: 
1. POST (Power on self test)
2. BIOS (Basic input output system)
3. Bootloader (MBR- master boot record- 512bytes: 446bytes=IPL(initial ), 64bytes=PTI 2bytes=MN): 
4. GRUB2 (Grand uniform bootloader) support both BIOS/MBR and UEFI/GPT partition scheme. ie. filesystem, dualboot
5. Kernel /boot filesystem into the memory
	#/boot/grub2/grub.cfg
6. Kernel loads the initial RAM imgage from /boot file system into memory.
7. Mount this image as read-only mode to serve as temporary root file system.
	Allow kernel to bypass mounting the actual physical root user.
	Finally kernel unmount image and mount the root file system to be fully functional.
8. initialization = systemd

How to reset root user password?
--> strat from console
# Send Key -> Atl+ctrl+del 
	select kernel mode and press e 
	go to end of "kernel=auto" line and type "rd.break console=tty1" start(cntrl+x)
		Example: kernel=auto rd.break console=tty1
	# mount | grep /dev/vda1
	# mount -o remount,rw /sysroot		(changing sysroot to read-write mode)
	# mount | grep /dev/vda1
	# chroot /sysroot
	# passwd root
		New password:	(provide new password)
		Retype new password:
	# echo "trootent" | passwd --stdin root  (reset password using echo)
	# touch /.autorelabel
	# exit
	# exit
	start machine.

Trubleshooting machine if found errors while rebooting.
--> send key -> Atl+Ctrl+Del
	Select non-rescue mode.(first option)
	go to "kernel=auto" line and add below at the end
		system.unit=emergency.target
	Ctrl+x
	Give root user password:
	# mount -o remount,rw /
	# mount -a 
		mount: /disk1: mount point does not exit.
	# vim /etc/fstab
		( check and update fstab file content with proper values.)
	# systemctl daemon-reload
	# mount -a
	# reboot



/******** Managing layered storage with stratis ************/
-- Volume managing file system
-- stratis run as a service that manage pool of physical storage devices.
1. sda, vda, hda
2. storage pool
3. filesystem

Packages: stratis-cli, stratisd
# fdisk -l
# yum install stratis-cli stratisd -y
# systemctl enable --now stratisd
# fdisk -l
# stratis pool create pool1 /dev/vdb
# stratis pool list
# stratis pool add-data pool1 /dev/vdc
# stratis pool list
# stratis blockdev list pool1			(what are the block devices added)
# stratis filesystem create pool1 fs1		(create a filesystem)
# stratis filesystem list
# stratis filesystem snapshot pool1 fs1 sn1		(create a snapshot)
# stratis filesystem list
--mounting it
# mkdir /stratisvol
# mount /stratis/pool1/fs1 /stratisvol
# cd /stratisvol/
# vim file1.txt
	hello world
# ls
# stratis filesystem snapshot pool1 fs1 sn2		(create snapshot)
# stratis filesystem list
# rm /stratisvol/file1.txt
# mkdir /snapm
# blkid /stratis/pool1/sn2		(copy UUID from here)
# vim /etc/fstab
	UUID="fjdkfjadkfjdak" /snapm xfs defaults,x-systemd.requires=stratisd.service 0 0
# systemctl daemon-reload
# mount -a 
# df -hT

-- check 
# stratis pool list
# stratis blockdev list

/****** VDO Virtual disk/data optimizer *******/
# example: 5GB --- logically --50GB
1. Zero block elimination
2. deduplication
3. compression (LZ4 algorithm)

Question: Create VDO volume labvdo, with device /dev/vdc.
	- Set the logical size to 50GB
	- Mount the volume labvdo on /labvdovol with XFS file system so that it persists across reboots.
	- happending on the volume
Answer: # fdisk -l
	# yum install vdo kmod-kvdo -y
	# vdo create --name=labvdo --device=/dev/vdd --vdoLogicalSize=50G
	# vdo list
	# blkid
	# mkfs -t xfs -K /dev/mapper/labvdo 
	# udevadm settle
	# mkdir /labvdovol
	# blkid /dev/mapper/labvdo		(copy UUID from here)
	# vim /etc/fstab
		UUID="fdfdajfdkajd"		/labvdovol xfs defaults,x-systemd.requires=vdo.service	0	0
	# systemctl daemon-reload
	# mount -a 
	# df -hT
	
	#vdostats --human-readable		(checking status)

