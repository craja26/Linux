----********* RHEL-8: Commands *********-------

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
	Search number ranges 10 to 20: # 
Question: Find a string 'ich' from "/usr/share/dict/words" and put it into /root/lines file.
Answer: # grep 'ich' /usr/share/dict/words > /root/lines



