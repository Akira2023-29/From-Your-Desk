FROM ruby:3.2.2

# node.js, yarn、postgressqlクライアントツールをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# コンテナー起動時に毎回実行されるスクリプト
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# コンテナ起動時にrailsサーバー起動
CMD ["rails", "server", "-b", "0.0.0.0"]