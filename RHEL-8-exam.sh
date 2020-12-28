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
		# chmod u+s <filename> numberical value=4
		
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
			# su - dax		(change user loging to dax)
			# cd /google/
				Permissions denied error
			# chown :manager /google/
			# su - dax		(change user login to dax)
			# cd /google/
				dax can able to access
			
			
	- sticky bit: users with write permission on their directory, can remove the file they own. They cannot remove/modify for the other users. It is always applied to the folder.
		- syntax: chmod o+t <folder> numberical value 1
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
	- systemd (REHL-7/8 - systemd)
	- upto REHL-6 init is the first process.

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
	- generate key: # ssh-kaygen  (it will generate unique state key. It uses RSA algorithm )
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
			# nmcli connection modify coss ipv4.addresses 172.25.250.10/24 ipv4.172.25.250.254 ipv.dns 172.25.254.254 ipv4.dns-search lab.example.com ipv4.method static
			
			-check entries
			# cat /etc/sysconfig/network-scripts/ifcfg-coss
			# nmcli connection show
			# nmcli connection up coss
			
			
		2. nmtui (network manager text user interface.
			# nmtli
				- edit
					- Ethernet
						- Add required details and save it.
						
			
		
Note: on a single device(enp1s0) you can add multiple connections at a time. only one connection is active.
		
	- dynamic(dhcp):
	
