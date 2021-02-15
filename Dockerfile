FROM ubi8
USER root
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y procps which sshpass siege jq python3-pip
RUN pip3 install --upgrade pip
USER 1001
RUN pip3 install ansible --user

