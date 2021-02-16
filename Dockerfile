FROM ubi8
USER root

ENV \
    APP_ROOT=/opt/app-root \
    HOME=/opt/app-root/src \
    PATH=/opt/app-root/src/bin:/opt/app-root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    PLATFORM="el8"
RUN subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && dnf clean all -y
RUN dnf install -y procps which sshpass siege jq ansible  && dnf clean all -y

RUN mkdir -p ${APP_ROOT} && \
    chown -R 1001:1001 ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}

RUN useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin \
    -c "Default Application User" default && \
    chown -R 1001:0 ${APP_ROOT}

USER 1001
WORKDIR ${APP_ROOT}}
