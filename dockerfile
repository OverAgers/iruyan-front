# ベースイメージとしてNode.js 20.12.2を使用
FROM node:20.12.2

# 作業ディレクトリを作成
WORKDIR /app

# # パッケージマネージャーとしてyarnをグローバルにインストール
# RUN npm install -g yarn

# プロジェクトのpackage.jsonとyarn.lockをコピー
COPY package.json yarn.lock ./

# Next.jsのバージョン14.2.3をインストール
RUN yarn add next@15.0.0

# 他の依存パッケージをインストール
RUN yarn install

# アプリケーションのソースコードをすべてコピー
COPY . .

# ビルドコマンド (Next.jsアプリをビルド)
RUN yarn build

# Next.jsアプリの起動ポート
EXPOSE 3000

# コンテナ起動時にNext.jsのアプリを起動
CMD ["yarn", "start"]