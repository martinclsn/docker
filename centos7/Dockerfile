FROM centos:7

RUN yum -y update; yum clean all
RUN yum -y install epel-release openssh-server net-tools passwd
RUN yum -y groupinstall "X Window System"

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN echo 'root:chpasswd' | chpasswd

EXPOSE 22
ENTRYPOINT ["/bin/bash"]




