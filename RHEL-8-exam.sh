----********* RHEL-8: Exam *********-------

Kernel - will manage all the hardware componets also Application services
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
you can find "!!" at user name line.
How to check whether user password is unlocked: tail -n -15 /etc/passwd
you can see "$number$" at user name line.

Get the word count of a file: # wc /etc/passwd
* copy last argument of previous command: esc . (escape then dot)

How to check a file or directory: #	file /etc/passwd
									file /etc


Open calculator: # bc
Open calender: # cal
Check failure login attempts: # lastb   (Admin can only run this command)
Check the commands history: # history
If you want to re-execute one of the history command: # !5  (executing 5 command in the history)

Open new terminal: ctrl+shift+t

/********* distributed file syste ***********/
#pwd 
/root
List out all files and folders: ll
How many files in Linux OS:
	- = regualr file
	d = directory
	c = character file
	b = blk file
	l = linked file
	p = piped file
	s = socket file
	
Explain "ll" results:
	- = regular file
	9 fields = permission for the user(owner of the file), permission of the group owner, permission for others.
	. = Advance permission(acl/adv). If ther is any special permission, it going to be +
	1 = number of linked files
	root = file owner
	root = group owner
	6503 =  file size in bytes in memory
	date time	 = timestamp
		 = file name/ folder name

total 16: total number of blocks  for files and hidden files occupied in memory

Check properties of files: # ls -l
Check block used in memory for a file: # ls -as1 original-ks.cfg
Check perticular property of a directory:  # ls -ld Music/
Check perticular property of a file: # ls -l <filename>

Default file system distributed inside "/": # ls /
Everything is organized in distributed files system under "/".

At the time of installation / and /boot will be created first.

/bin: all the binary executable files stored inside here up to REHL-6
/urs/bin stores binary executable files in REHL-7 and 8

/dev: stores all the device information.
/home: regular user home directory.
/lib64:
/boot: will store boot information.
/media:  all the removable device data.
/mnt: non removable device data(example: download from internet).
/opt: will store optional data or third party software vendor data.
	Third party software vendor data.
	1st party: software with REHL in build
	2nd: (subscription of REHL) 
	3rd: example database software vendor, any third party software vendor.
/proc: Running kernel information.
	it is a virtual directory. Exapmle: cpu, memory, network
/run: run time data for the processes.
	ex: process id,
/sbin: super user system executable commands.
	checking example:	# which useradd
						# which fdisk
/etc: All the configuration files stored inside the etc folder.
/srv: container management, www, .
/tmp: store temporary files. It will automatically get deleted if it is not used from past 10 days.
/var: frequentially changes data(example: mail server data, database, webserver)
/usr: stored all the documentation.(example: frontend code, programs)

/******** Create own files and directory ********/
New terminal: ctrl+shift+t
Create a directory: mkdir <directory name>

Types of directory struncture:
	1. Nested directory
		/data
		data1
		data2
	2. Childlevel directory
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
|  |-sa3
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
	- It always create an empty file.
	-Example: touch linux
	Create multiple files at a time: # touch coss(1..10).txt
2. cat > <filename>
	- cat > linux2
hello world!
Good morning

save: wq!
	- adding more contenct to a file.
	- cat >> linux2
	- ctrl+d save file after adding.
	Note: > = overwritting, >> = appending
	- We cannot delete, update using "cat" command.
3. vi, vim, nano, gedit.


/********* Copy and Move *********/
Copy: cp
	replicating backup of original data.
Exapmle:
	create a file: # touch apple
	Add content: # cat > apple
	Hi all
	(ctrl+d) for save
	Copy: # cp apple newapple
	
	If copy is creating a new file in the same directory, it only creates new file. If you are copying to a different directory then it will take backup and create new file.
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
		remove the line nuber = esc + set nonu
		Go to begining of line = esc + gg
		End of line = esc + shift+g
		Go to specific line: esc + :number
		delete line: esc + ndd
		delete a word: esc + ndw
		delete a char: ctrl +x
		insert mode = esc + i
		search word linux ingore case sensitive: 
			:/linux\c
			(or)
			
		search and replace: esc +:%s /<search word>/<replace word>/gi
		delete number line number 2 to 4: esc + :2,2d
		search "is" in first three lines: esc + :1,2s /is 
		search "training" word in the first three line and replace with "abcdef":  esc + :1,2s /training/abcdef

		Note: refere commands: vimtutor
	2. execution mode/ insert mode
		Search a word with "root" and replace with "root123":
			esc + :%s /root/root123   (it will replace one word in a line if it is more than one root word)
			esc +  :%s /root/root123/g
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
	# find / -name shadow -type d  --#It is case sensitive 
	# find / -iname shadow -type d   --# it is case insensitive

-- Each file having unique index/inode number
	- check index/inode number: # ls -il <filename>
	
Esc ww - to swith cursor between multiple files

- Hardlink file: 
	- It is a backup file.
	- Only applied to the files
	- If the original file is deleted there is a backup.
	- Inode number is same.
	- Difficult to identify.
	- Stored only with in the filesystem
- Softlink file:
	- It is a shortcut file
	- can applied for files and folders
	- If the the orginal file is deleted there is no use of shortcut file.
	- Inode is different from the original file.
	- Easy to identify.
	- Can store anywhere filesystem
	
- Create Hardlink: # ln <source file> <new file name>
- Create softlink: # ln -s <source file> <new file name>


/******** User Group Management *********/

What is a user? Why we need a user?
- Ever person logs into a system is a user. Each file and folder by owned by a particular user. Every process run by a particular user.
- Autherized person to access our system resources. Each user is identified by unique name.

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
- Which file stores passwordd
	- /etc/shadow
which file stores users list
	- /etc/passwd
- which file stores group 
	- /etc/group
- which file stored group admin
	- /etc/gshadow

- Search a particular "word" in above four files.
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

username: password place holder: usid: groupid: comment: user home dir: loginshare

- Explain shadow file fields
	- grep vamsi /etc/shadow
	username: encryptedpassword: no.of days last password change(since 1970): Min day: Max day: warning period: inactive days: expire days(-1): future use 
	
	# grep ram /etc/shadow
	- Shadow file encrypted password using different machanizm. We can find machanizm name based on number value specified after $ symbol.
		$4 = md5
		$5 = sha256
		$6 = sha512  (REHL - 8)
		
- Check account details(example: password expire date, last password change date):
	# chage -l ram

-Change account password properties: minimum date to change, maximum days to change, warning days before password expire.
	# chage -m 2 -M 7 -W 3 -I 2 ram
	# chage -l ram              (checking properties for ram)

- /etc/group : save group information:
	# grep ram /etc/group
	user primary group name: group password place holder( always pointing to shadow file): group id: comma separated by members
	
- add a group: # groupadd coss
- add user sandeep to newly added group: # useradd -G coss sandeep
- check naveen is member of how many groups: # groups naveen
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
	
add a user as a admin using visudo file.
	- Go to "visudo" file, go to line number 21, add new entry for admins.
	- same way you can grant required permissions for a user using visudo

/******* Permissions ********/
- To privent the access from the unathorized users we apply permissions to files and folders.
- There are three types of permissions.
	- read  =r =4
	- write =w =2
	- execute =x =1
	Note: when you create a new file, the execute permission is not there.
	If you create a folder you can see execute permission.
	
	- Users in the system categorized into 3 different class
		- Owner/user : who create the file.
		- group: who creates it group: it is own private or he/she a member of some group.
		- other: neither the owner nor a number of any group.
What is the default permission of a file?
	- default permissions for a file 644 
	- for non-privileged user it is 664.
* Default value is depending on "umask" value
	example: (rwrwrw - umask)
	# umask
	# vim /etc/bashrc
- umask for root is: 022
	umask calculation: using decimal to binary then applying read/write/execute based on result.
	value = binary = r/w/x (Here is 0 position is present, 1 means obsent)
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
	* We can use letters or numerical methods. But numerical method is easy to grant access.

- How to change owenrship?
	- chown is the command to change owner.
	
	- Change owner from root to student
	# chown student redhat
	
	- change group owner to student
	# chgrp student redhat
	
	- change ownership and group onwership to root
	# chown root:root redhat
	
	- change group owner to dba
	# chown :dba redhat
	
	- change data directory group owner to dba for folder and subdirectories
	# chgrp -R dba /data
	
* regular user cannot run "chown", admin can only run.

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
	- suid: defined as giving temporary permission to run a program file with the permission of file owner rather than the user who run it.
		# chmod u+s <filename> numberical value=4
		
		Example: check special permissions for below files. You can find "s" instead "x" in the permissions.
			ls -l /usr/bin/su
			ls -l /usr/bin/passwd
		- Find all files having suid permission.
			# find / -perm /u+s
		- grant special permission using numerical values
			# chmod 4755 <filename>
	- sgid : set on directories to allow files and subdirectories inside that directories automatically inherite the directories group ownership to future files and folders.
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
			# su - dax		(change user loging to dax)
			# cd /google/
				dax can able to access
			
			
	- stickybit: user with write permission on their directory, can remove the file they own. They cannot remove/modify for the other users. It is always applied on the folder.
		- syntax: chmod o+t <folder> numberical value 1
		Example: # chmod o+t /google/
			# ls -ld /google/
		

/****** access control list *******/


