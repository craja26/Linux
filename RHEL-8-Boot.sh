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
	# echo "trootent" | passwd --stdin root  (reset password using echo)
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
