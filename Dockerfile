# syntax=docker/dockerfile:1.3

FROM	debian:bullseye-slim

WORKDIR	/packer

ARG	DEBIAN_FRONTEND="noninteractive"

ENV	LANG="C.UTF-8"

ENV	LC_ALL="C.UTF-8"

RUN	--mount=type=tmpfs,target=/var/cache/apt \
	--mount=type=tmpfs,target=/var/lib/apt \
	apt update -qqq \
	&& apt dist-upgrade -qqq \
	&& apt install --no-install-recommends -qqq \
		ansible \
		openssh-client \
		qemu-kvm \
		qemu-utils

COPY	--from=hashicorp/packer /bin/packer /usr/bin/packer

CMD	packer
