FROM ruby:3.0.2-alpine

ENV BUNDLER_VERSION=2.2.32

RUN apk add --update --no-cache \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      nano \
      yarn

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install


COPY . ./

ENTRYPOINT ["sh", "./entrypoints/docker-entrypoint.sh"]