FROM centos:7

RUN yum -y update; \
    yum clean all; \
    yum -y install \
        epel-release \
        nc \
        openssh-clients \
        openssh-server \
        passwd

RUN yum install -y supervisor

RUN mkdir -p /var/run/sshd /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config

RUN echo 'root:chpasswd' | chpasswd

EXPOSE 22
ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]




