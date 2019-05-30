FROM alpine:edge

LABEL version="1"
LABEL maintainer="Alex Ivkin"

ENV UID=1000 GID=1000

# install sdk and the latest available kernel, create the user and add to sudoers
RUN apk --no-cache add alpine-sdk linux-vanilla \
 && umask 0002 \
 && addgroup -g $GID developer \
 && adduser -S -u $UID -G developer -h /home/developer developer \
 && adduser developer abuild \
 && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Clone the aports repo and create the build key
USER developer
WORKDIR /home/developer
RUN git clone https://github.com/alpinelinux/aports

VOLUME ["build"]
