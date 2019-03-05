FROM centos:7

RUN yum update -y
RUN yum install wget -y
RUN yum install perl "perl(DBD::mysql)" "perl(DBI)" -y


RUN wget https://github.com/sysown/proxysql/releases/download/v1.4.15/proxysql-1.4.15-1-dbg-centos7.x86_64.rpm
RUN rpm -i proxysql-*.rpm

RUN mkdir /var/lib/proxysql

CMD ["/usr/bin/proxysql", "--initial", "--config=/etc/proxysql.cnf", "--exit-on-error", "--foreground"]