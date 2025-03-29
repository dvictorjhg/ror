FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c AS base

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    bash \
    build-base \
    bzip2 \
    gcompat \
    gdbm-dev \
    git \
    libffi-dev \
    ncurses-dev \
    nodejs \
    npm \
    openssl-dev \
    patch \
    perl \
    readline-dev \
    shadow \
    sqlite \
    sqlite-dev \
    sudo \
    tzdata \
    yaml-dev \
    zlib-dev

# Create a non-root user
RUN addgroup rails \
    && adduser -G rails -D -s /bin/bash rails \
    && echo 'rails ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY --chmod=0755 docker/ror/ror.devcontainer.docker-entrypoint.sh /usr/local/bin/ror.devcontainer.docker-entrypoint.sh


FROM base AS ruby

USER rails
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc \
    && RUBY_CONFIGURE_OPTS="--disable-install-doc" ~/.rbenv/bin/rbenv install 2.7.8 \
    && ~/.rbenv/bin/rbenv global 2.7.8 \
    && bash -c "source ~/.bashrc \
    && gem install rubygems-update -v 3.4.22 \
    && update_rubygems \
    && gem install solargraph"


FROM ruby AS rails

RUN bash -c "source ~/.bashrc \
    && gem install rails -v 4.2.11.3 \
    && gem install solargraph-rails \
    && gem install rubocop-rails"

WORKDIR /workspace

CMD [ "bin/rails", "server", "-b", "0.0.0.0" ]
ENTRYPOINT [ "ror.devcontainer.docker-entrypoint.sh" ]
