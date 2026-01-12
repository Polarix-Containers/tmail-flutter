ARG VERSION=0.23.1

FROM unprivileged-mainline-slim
ARG VERSION

COPY --from=ghcr.io/linagora/tmail-web:v${VERSION} /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=ghcr.io/linagora/tmail-web:v${VERSION} /usr/share/nginx/html /usr/share/nginx/html

USER root

RUN sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/nginx.conf

USER nginx