NAME =			zerobin
VERSION =		latest
VERSION_ALIASES =	
TITLE =			Zerobin
DESCRIPTION =		Zerobin
SOURCE_URL =		https://github.com/scaleway/image-app-zerobin
VENDOR_URL =		https://zerobin.net

IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            ZeroBin


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk

