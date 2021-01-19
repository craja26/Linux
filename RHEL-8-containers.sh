/********** RHEL-Containers *************/
- Three ways we can define a Container
1. OS prospective:
	Container is just a process which is running inside the SAN box. Container processes are completely isolated from the host operating system.
		a. Namespaces: PID, GID, filesystem, ipc, networkid (nwid), volume
		b. cgroup: consume some cpu, memory, network i/o, block io managed by control group.
		c. SELinux: MAC(Mandatory access control)
2. sa prospective:
	Container is just an application. It can be java, perl, php, node.js, mysql, postgresql.
	Which is portable in a different environment.
	Portability is the beauty of containers.
	Low footprint hardware.
3. developer prospective:
	How you are packaging the application.
	How you are building the images.
	
	docker is a terminology to build containerized applications.
	login to the register = docker.io, registry.redhat.io, quay.io
	

- Installing Container Management Tools
# yum module install container-tools

- Running a Basic Container
# yum module install container-tools		(installing container - it will install all the required packages/tools)
- Available images: docker.io, registry.redhat.io
# podman login registryredhat.io		(login to the registry)
	username:
	Password:
# podman images		(checking images in local registry)
# podman ps 		(checking ps in local)
# podman pull registry.redhat.io/rhel8/httpd-24:latest			(pull the image)
	syntax: podman pull registry_name/user_name/image_name:tag
# podman images		( you can see image now)
# podman run --name myweb -it registry.redhat.io/rhel8/httpd-24 /bin/bash		(running a container)
	$ ps aux		(you can see container processes)


----------------------

- hub.docker.com, registry.redhat.io
- Finding and managing container images
- Podman uses a registries.conf file on your host system to get information about the container registries it can use.
# cat /etc/containers/registries.conf		(it is for root user)
	[registries.search]
	registries = ['registry.redhat.io', 'quay.io', 'docker.io']
	[registries.insecure]
	registries = []
	[registries.block]
	registries = []

Note: For a regular (rootless) user of Podman, this file should be stored inside $ $HOME/.config/containers/ directory. Configuration settings in this file override the system-wide settings in the /etc/containers/registries.conf file.
Example: cat /home/raja/.config/containers/registries.conf
	unqualified-search-registries = ['registry.example.com']
	[[registry]]
	location = "registry.redhat.io"
	insecure = true
	blocked = false
# podman info		(checking information)
- Search the registry for images with a name that starts with "ubi"
	# podman search registry.redhat.io/ubi
	# podman search registry.redhat.io/rhel8/mariadb-103:1-102

- Login
	# podman login registry.redhat.io
		username: <>
		password: *****
	#
	
- Get detailed information about the container before installing it.
	# skopeo inspect docker://registry.redhat.io/rhel8/python-36

- Get the image to local machine
	# podman pull registry.redhat.io/rhel8/httpd-24:latest
	
	- you can also inspect locally stored image information using podman inspect command. This command might provide more information than the skopeo inspect command
	# podman images		(get list of downloaded images)
	# podman inspect registry.redhat.io/rhel8/python-36

- Remove images
	# podman images
	# podman rmi registry.redhat.io/rhel8/httpd-24

- Administering Containers with Podman
	-p  is port mapping
	-d is running in detached mode(running behind).
	Note: non root users need to mention port forwarding number greater than 1024.
		ex: -p 1025:8080		(here 1025 is local machine port and 8080 is container port)
	
	# podman ps 	(list running containers)
	# podman ps -a	(list all containers)
	
- example: run container image using mariadb
Question: Create a detached MariaDB database container based on the specification in the following substeps using podman run command. Confirm that the container is running and publishes the correct ports.
	q1. Create a detached container named mydb that used the container image registry.redhat.io/rhel8/mariadb-103:1-102. Your command must publish port 3306 in the container to the same port number on the host. You must also declare the following variable values to configure the container with the database user user1 (password redhat), set the root password to redhat, and create the database items.
	
Answer: Here are all steps.	
	# yum module install container-tools
	# cat /etc/containers/registries.conf or $ ~/.config/containers/registries.conf
	- Login to the registry
	# podman login registry.redhat.io
		username: <username>
		password: *******
	- I want to create a detached mariadb database container based on the specification
	# podman ps -a		(list out all containers)
	# podman images		(list out images)
	
	-- run the container directly without pulling.
	# podman run -d --name mydb -e MYSQL_USER=user1 -e MYSQL_PASSWORD=redhat -e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=redhat -p 3306:3306 registry.redhat.io/rhel8/mariadb-103:1-102
		(here -d = detached mode, -e = environment variable, -p =  port mapping)
	# podman ps		(checking running containers)
	
	- connect mariadb
	# mysql -uuser1 -p --port=3306 --host=127.0.0.1			(here we need to specify host port, then it will redirected/forwarded to container port)
	
--stop container "mydb"
	# podman stop mydb

----------------------------------------
Question: Create a container running an Apache HTTP Server that also starts an interactive Bash shell in the container. Run a command using the container's shell, and then exit the container and verify that container is no longer running.
	q1: Create a container named myweb that is running Apache HTTP Server 2.4, and also starts an interactive shell in the container. Use the regist.redhat.io/rhel8/httpd-24:1-105 container image. The following podman run command is very long and should be entered as a single line.
Answer:
	# podman run --name myweb -it regist.redhat.io/rhel8/httpd-24:1-105 /bin/bash
	
	q2: At the interactive shell prompt in the container, run the cat /etc/redhat-release command to display the contents of the /etc/redhat-release file in the container. Exit the container
Answer:
	bash-4.4$ cat /etc/redhat-release
	bash-4.4$ exit
	exit
	$
	q3. Verify that the myweb container is no longer running.
	# podman ps 

Question: Create a detached HTTPD web server container named mysecondweb. Connect to the container using its name, and then display the kernel name and release. Connect to the container a second time, but use the (-l) option to recall the ID of the container from the previous command and display the system load average. Leave the container running.
	q1. Create a detached container name mysecondweb.
Answer: podman run --name mysecondweb -d regist.redhat.io/rhel8/httpd-24:1-105

	q2. Connect to the mysecondweb container to display the Linux name and kernel release using podman exec command.
Answer: # podman exec mysecondweb uname -sr

	q3. Run the podman exec command again, this time using the (-l) option to use the container ID from the previous command to display the system load average.
Answer: # podman exec -l uptime

-- Podman log - checking error information. 
# podman log


/********* Attaching Persistent Storage to a Container **********/
- Mounting a Volume
$ rpm -qa httpd
$ mkdir -p ~/webcontent/html
$ vim ~/webcontent/html/index.html
	Hello world!
$ ls -lRZ ~/webcontent/
$ podman login registry.redhat.io
	username:
	password:
$ podman run -d --name myweb -p 8888:8080 -v ~/webcontent:/var/www:Z registry.redhat.io/rhel8/httpd-24:1-98
$ curl http://localhost:8888
	Hello world!
$ podman images

-- persistent volume /persistent volume claim  ( check it)


-------------------------

/********** Managing Containers as Services **********/
- Creating the Systemd Unit File
$ cd ~/.config/systemd/user/
$ podman generate systemd --name web --files --new 
	/home/user/.config/systemd/user/container-web.service
- The following example shows the start and stop directives in the unit file when you run the "podman generate systemd" command with the --new option.
$ podman run -d --name web -v /home/user/www:/var/www:Z registry.redhat.io/rhel8/httpd-24:1-105
$ podman generate systemd --name web --new

- Starting and stopping Containers using Systemd
- Starting the container:
$ systemctl --user start container-web

- Stopping the container:
$ systemctl --user stop container-web

- Getting status of the container
$ systemctl --user status container-web

- Configuring Containers to start when the Host machine starts
- to enable a container to start when the host machine starts, using loginctl command
$ loginctl enable-linger

- to enable a container to start when the host machine starts, use the systemctl command:
$ systemctl --user enable container-web

Task: Create systemd unit files for managing containers.
	Start and stop containers using systemctl commands.
	Configure user accounts for systemd user services to start when the host machine starts.
	
Question: Create a container logserver from an image rsyslog in node 1 from registry.lab.example.com. Configure the container with systemd service by an existing user walhalla. Service name should be container-logserver and configure it automatically across reboot.

# useradd contsvc
# passwd contsvc
# exit
$ ssh contsvc@servername
	password:
$ ls
$ mkdir -p ~/.conf/containers/
$ cp /tmp/containers-services/registeries.conf ~/.conf/containers/
$ vim ~/.conf/containers/registries.conf
	(check file content)
$ podman search ubi
$ pwd
$ mkdir -p webcontent/html
$ vim webcontent/html/index.html
	This is a sample html file.
$ ls -lRZ webcontenct/
$ podman login registry.redhat.io
	username:
	password:
$ podman run --name myweb -d -p 8888:8080 -v /home/contsvc/webcontenct:/var/www:Z registry.redhat.io/rhel/httpd-24:1-105
$ podman ps 
$ podman images
$ curl http://localhost:8888
	This is sample html file.
$ mkdir ~/.config/systemd/user/ -p
$ cd .config/systemd/user/
$ podman generate systemd --name myweb --files --new		(generating a file)
$ vim /home/contsvc/webcontent/container-myweb.service		(checking file content)
$ podman stop myweb
$ podman rm myweb
$ systemctl --user daemon-reload
$ podman ps
$ podman ps -a		(no container running background as well)
$ systemctl --user enable --now container-myweb.service		(enabling and running service)
$ podman ps
$ curl http://localhost:8888

$ systemctl --user stop container-myweb.service		(stopping service)
$ podman ps
$ systemctl --user start container-myweb.service	( starting service)
$ podman ps

-across reboot service active and running.
$ loginctl enable-linger
$ loginctl show-user contsvc
$ su -
# reboot		(reboot server to check service)
$ ssh contsvc@server
$ podman ps 


Task:
1. On serverb, install the container tools. Login to serverb as the student user, and then user sudo command. The password of the student user is student.
	$ ssh student@serverb
		password:
	$ sudo yum module install container-tools -y
		[sudo] password:
	
2. The container image registry at registry.redhat.io stores the rhel8/mariadb-103 image with several tags. On serverb, as the podsvc user, list those tags and take note of the tag with the lowest version number. You will use that image tag to start a container later in this exercise.
	The password for podsvc users is redhat. To query the registry.redhat.io registry, use the admin account with redhat321 for the password.
	$ ssh podsvc@serverb
		password: 
	$ podman login registry.redhat.io
		username: admin
		password: redhat321
	$ podman images
	$ skopeo inspect docker://registry.redhat.io/rhel8/mariadb-103
		example: lowest is "1-86" (Check RepoTags in the results.)
3. On serverb, as the podsvc iser, create the /home/podsvc/db_data directory. Prepare the directory so that containers read/write access. You will use this directory for persistent storage.
	$ mkdir /home/podsvc/db_data -p
	$ ls -ld /home/podsvc/db_data
	$ chmod 777 /home/podsvc/db_data
4. On serverb, as the podsvc user, create a detached MariaDB container named "inventorydb". Use the rhel8/mariadb-103 image from the registry.redhat.io registry, specifying the tag with the lowest version number on that image, which you found in a preceding step. Map port 3306 in the container to port 13306 on the host. Mount the /home/podsvc/db_data directory on the host as /var/lib/mysql/data in the container. Declare the following variable values.
		Variable			Value
		MYSQL_USER			operator1
		MYSQL_PASSWORD		redhat
		MYSQL_DATABASE		inventory
		MYSQL_ROOT_PASSWORD	redhat
		
	$ podman run -d --name inventorydb -p 13306:3306 -v /home/podsvc/db_data/:/var/lib/mysql/data:Z -e MYSQL_USER=operator1 -e MYSQL_PASSWORD=redhat -e MYSQL_DATABASE=inventory -e MYSQL_ROOT_PASSWORD=redhat registry.redhat.io/rhel8/mariadb-103:1-86
	
	To confirm that the MariaDB database is running, use the mysql command. You can find this command in the /home/podsvc/containers-review/testdb.sh. You can also directly run the script to test the database.
	$ podman ps
	$ mysql -uoperator1 -p --host=127.0.0.1 --port=13306
	MariaDB > show databases;
	
5. On serverb, as the podsvc user, configure systemd so that the inventorydb container starts automatically with the server.
	$ mkdir -p ~/.config/systemd/user/
	$ cd .config/systemd/user/
	$ podman ps
	$ podman generate systemd --name inventorydb --files --new
	$ podman stop inventorydb
	$ podman rm inventorydb
	$ podman ps -a
	$ systemctl --user daemon-reload
	$ systemctl --user enable --now container-inventorydb.service
	$ podman ps
	$ loginctl enable-linger
	











Question: Configure your host journal to store all journals across reboot. Copy all *.journal from /var/log/journal and all subdirectories to /home/walhalla/container-logserver. Configure automount /var/log/journal from logserver container to /home/walhalla/container-logserver when container start


