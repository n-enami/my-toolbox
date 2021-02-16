FROM ubi8
USER root
ENV APP_ROOT /opt/app-root
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y procps which sshpass siege jq python3-pip
RUN pip3 install --upgrade pip

RUN mkdir -p ${APP_ROOT} && \
    chown -R 1001:1001 ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}

USER 1001
WORKDIR ${APP_ROOT}}
RUN pip3 install ansible --user

