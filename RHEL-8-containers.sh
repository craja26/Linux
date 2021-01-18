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

