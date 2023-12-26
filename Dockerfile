FROM ruby:3.2.2

# node.js, yarn、postgressqlクライアントツールをインストール
RUN wget --quiet -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y nodejs yarn postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY yarn.lock /app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /app

# entrypoint.shスクリプトファイルを、ローカルからDockerコンテナ内の/usr/bin/ディレクトリにコピー。
# このファイルはコンテナ起動時に特定のコマンドを実行するために使われる=>初期設定や起動時のタスクを指定。
COPY entrypoint.sh /usr/bin/
# コピーしたentrypoint.shスクリプトに実行権限を付与（これをしないとスクリプトが実行できない）。
RUN chmod +x /usr/bin/entrypoint.sh
# コンテナが起動するときにデフォルトで実行されるコマンドをentrypoint.shに設定する。
ENTRYPOINT ["entrypoint.sh"]
# コンテナがリッスンするポート3000番を指定し、Dockerホストに公開。
EXPOSE 3000

# コンテナ起動時にrailsサーバー起動
CMD ["rails", "server", "-b", "0.0.0.0"]