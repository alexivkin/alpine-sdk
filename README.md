# Docker Alpine build environment

Alpine SDK build environment, set up as a user "developer" with UID:GID of 1000:1000
You can use sudo with no password for installing additional packages

The image contains a clone of the Alpine Linux aports repository and the kernel current at the container build time. After you start the container you can refresh both with

	git -C aports pull
	sudo apk add linux-vanilla

Do not forget to generate your build key with

	abuild-keygen -a -i
