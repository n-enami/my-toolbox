FROM ubi8
USER root
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y procps siege jq python3-pip python3-setuptools
USER 1001
RUN pip3 install ansible --user ; exit 0
