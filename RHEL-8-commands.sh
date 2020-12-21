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
/srv: container management.
/tmp: store temporary files. It will automatically get deleted if it is not used from past 10 days.
/var: frequentially changes data(example: mail server data, database, webserver)
/usr: stored all the documentation.(example: frontend code, programs)

