FROM centos:6

RUN yum -y update; yum clean all; 
RUN yum -y install epel-release openssh-server
RUN yum -y groupinstall "X Window System"

RUN echo 'root:chpasswd' | chpasswd

#Desktop + VNC server
RUN yum -y groupinstall "Desktop"
RUN yum -y install "tigervnc-server"
RUN adduser vnc
RUN echo 'vnc:vncvnc' | chpasswd


EXPOSE 22
CMD service sshd start && while true; do sleep 3000; done