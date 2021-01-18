
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

