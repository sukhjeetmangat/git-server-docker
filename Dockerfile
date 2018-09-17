FROM alpine:3.5

RUN apk add --no-cache \
  openssh \
  git

# Key generation on the server
RUN ssh-keygen -A

# SSH autorun
# RUN rc-update add sshd

WORKDIR /tmp/

# -D flag avoids password generation
# -s flag changes user's shell
RUN adduser -D git \
  && echo git:12345 | chpasswd \
  && mkdir /home/git/.ssh

# sshd_config file is edited for enable access key and disable access password
COPY sshd_config /etc/ssh/sshd_config
COPY start.sh start.sh

EXPOSE 22

CMD ["sh", "start.sh"]
