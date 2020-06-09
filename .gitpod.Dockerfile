FROM gitpod/workspace-mysql

# optional: use a custom Nginx config.
COPY gitpod/nginx.conf /etc/nginx/nginx.conf
COPY gitpod/default.conf /etc/nginx/conf.d/defatul.conf

# optional: change document root folder. It's relative to your git working copy.
ENV NGINX_DOCROOT_IN_REPO="html"

USER gitpod
