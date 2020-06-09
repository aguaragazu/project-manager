FROM gitpod/workspace-mysql

# optional: use a custom Nginx config.
# COPY ./gitpod/nginx/nginx.conf /etc/nginx/nginx.conf
# COPY ./gitpod/nginx/default.conf /etc/nginx/conf.d/defatul.conf

# Install our own MySQL config
# COPY ./gitpod/mysql/my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# optional: change document root folder. It's relative to your git working copy.
ENV NGINX_DOCROOT_IN_REPO="html"

RUN sudo apt-get update -q \
    && sudo apt-get install -y php-dev

RUN wget http://xdebug.org/files/xdebug-2.9.1.tgz \
    && tar -xvzf xdebug-2.9.1.tgz \
    && cd xdebug-2.9.1 \
    && phpize \
    && ./configure \
    && make \
    && sudo cp modules/xdebug.so /usr/lib/php/20170718 \
    && sudo bash -c "echo -e '\nzend_extension = /usr/lib/php/20170718/xdebug.so\n[XDebug]\nxdebug.remote_enable = 1\nxdebug.remote_autostart = 1\n' >> /etc/php/7.4/cli/php.ini"


USER gitpod

