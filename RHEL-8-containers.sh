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


