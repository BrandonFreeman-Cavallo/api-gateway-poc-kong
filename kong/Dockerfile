FROM kong:3.3.1-ubuntu

USER 0

WORKDIR /tmp

RUN luarocks install kong-jwt2header
# RUN luarocks install kong-oidc

COPY ./kong-oidc /tmp/kong-oidc

WORKDIR /tmp/kong-oidc
RUN luarocks make

# RUN apt update \
#     && apt install -y unzip wget

# RUN mkdir -p /tmp/kong-jwt2header \
#     && wget https://github.com/yesinteractive/kong-jwt2header/archive/refs/heads/master.zip \
#     && unzip master.zip -d /tmp/kong-jwt2header \
#     && mkdir -p /usr/local/share/lua/5.1/kong/plugins/kong-jwt2header \
#     && mv -v /tmp/kong-jwt2header/kong-jwt2header-master/plugin/* /usr/local/share/lua/5.1/kong/plugins/kong-jwt2header \
#     && rm -rf /tmp/kong-jwt2header


USER kong
