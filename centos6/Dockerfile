FROM centos:6

RUN yum -y update; yum clean all; 
RUN yum -y install epel-release openssh-server
RUN yum -y groupinstall "X Window System"

RUN echo 'root:chpasswd' | chpasswd

#VNC server
RUN yum -y install "tigervnc-server"
RUN adduser vnc
RUN echo 'vnc:vncvnc' | chpasswd

#Desktop
RUN yum -y groupinstall "Desktop"

EXPOSE 22
EXPOSE 5901

CMD service sshd start && while true; do sleep 3000; done