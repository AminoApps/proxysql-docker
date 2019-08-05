FROM centos:7

RUN yum update -y
RUN yum install wget -y
RUN yum install perl "perl(DBD::mysql)" "perl(DBI)" -y


RUN wget https://github.com/sysown/proxysql/releases/download/v2.0.5/proxysql-2.0.5-1-centos7.x86_64.rpm
RUN rpm -i proxysql-*.rpm

RUN mkdir -p /var/lib/proxysql

CMD ["/usr/bin/proxysql", "--initial", "--config=/etc/proxysql.cnf", "--exit-on-error", "--foreground"]
