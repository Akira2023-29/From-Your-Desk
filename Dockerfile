# FROM ruby:3.2.2

# # Node.jsとYarnのインストールに必要なリポジトリを追加
# RUN curl -sL https://deb.nodesource.com/setup_latest.x | bash - && \
#     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
# RUN mkdir /app
# WORKDIR /app

# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock

# RUN bundle install
# COPY . /app

# # コンテナー起動時に毎回実行されるスクリプト
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # コンテナ起動時にrailsサーバー起動
# CMD ["rails", "server", "-b", "0.0.0.0"]


FROM ruby:3.2.2
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY yarn.lock /app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /app