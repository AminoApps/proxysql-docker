FROM centos:7

COPY proxysql.repo /etc/yum.repos.d/proxysql.repo
RUN yum install proxysql -y
RUN mkdir /var/lib/proxysql

CMD ["/usr/bin/proxysql", "--initial", "--config=/etc/proxysql.cnf", "--exit-on-error", "--foreground"]