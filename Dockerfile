# Comment
FROM tutum/centos

MAINTAINER TRAY
LABEL Vendor="CentOS"

RUN echo 'Estamos comecando a inicializar seu container'

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all
RUN yum -y install php php-mysql
RUN yum -y install php openssl
RUN yum -y install php-mbstring.x86_64
RUN yum -y install php-mcrypt.x86_64
RUN yum -y install php-xml
RUN yum -y install git.x86_64
RUN yum -y install npm
RUN yum -y install tar.x86_64
RUN yum -y install bzip2.x86_64
RUN yum -y install php-phpunit-PHPUnit.noarch
RUN npm install bower -g
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin
RUN cp /bin/composer.phar /bin/composer

EXPOSE 80

#Adiciona os Vhost
ADD httpd/virtualHost.conf /etc/httpd/conf.d/

#Volume a ser utilizado pelo APACHE
VOLUME ["/var/www/html"]

#Ditorio de trabalho dentro do container
WORKDIR /var/www/html

RUN chmod -Rf 777 /var/www/html

#Chama o script de inicialização do HTTPD
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh


CMD ["/run-httpd.sh"]




