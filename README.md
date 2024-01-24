## サービス名
デスク色彩診断

## サービス概要
在宅やオフィスでデスクワークをする人は多くの時間をデスク環境で過ごします。
しかし、そんなデスク環境を見直してより改善しようとしている人は少ないのではないでしょうか。
もしくは、最初にセッティングしたデスク環境のままずっと作業されている人が多いのではないでしょうか。
このサービスはデスク環境の写真を診断し、人間が作業する上で最適な環境になるよう色彩の観点から改善案を提案することでデスク環境改善のきっかけを提供します。

## このサービスへの思い・作りたい理由
前職はオフィス空間（働く空間）を提案・提供する業界で働いており、様々な働き方改革を間近で見てきました。
中でも一番大きな変化として、リモートワークの導入が世の中で大きく進んだということが挙げられます。
私自身も約3年ほどリモートワークをしました。
その時は「いかに出社時より生産性を下げないか」を皆で考えて試行錯誤しました。

現在は前職を退社し、次の会社でもリモートワークで働くために（家庭の事情でフルリモートで働く必要があるため）転職目指しプログラミングの勉強をしています。
そんな中、プログラミング学習をしながら思うことがあります。  
「自分と同じプログラミング学習をしている方のデスク環境はどうなっているのだろう？」
また、「デスク環境を何か手を加えて改善する」といった行動は頻度としては少なく、自分のデスク環境もしばらく変えていませんでした。
そこで、「デスク写真を共有するにあたりデスク環境改善のきっかけを与える」というサービスがあればいいと思いました。
今回のサービスでは、投稿するデスク環境の写真を解析することで、その人が作業する上てより最適なデスク環境になれるアドバイスを提供します。

## ユーザー層について
- **デスクワークしている方**  
本サービスはデスク環境の写真からよりデスクワークの効率を上げるための診断結果を色彩の観点から提供します。

- **デスクワーク仲間のデスク環境が気になる方**  
本サービスはデスク環境の写真も診断結果と共にシェアすることで他の方のデスク環境が見れます。
他の方の診断結果も参考にしながら自分のデスク環境に取り入れることでデスクワークの効率改善に繋がります。

## サービスの利用イメージ
- **写真からデスク環境を診断**    
デスク写真を撮ってアップするだけで、簡単に自身のデスク環境を診断します。
デスクの場所・主な作業内容も選択・記述していただき、診断に反映いたします。

## ユーザーの獲得について
- **自宅でデスクワークしている方・デスクワーク仲間のデスク環境が気になる方**  
　X（旧twitter）やMattermostを通じて拡散したいと考えています。

## サービスの差別化ポイント・推しポイント
- **デスク環境の診断方法について**
　デスク環境の作業効率を改善するための情報を載せたサイトはいくつかありますが、実際にのデスク環境の写真から診断して改善案を出すようなサービスはありませんでした。
今回は画像解析APIを使用しデスク環境写真の **「色バランス」** を調べて、その色のバランスと色が人間の作業に与える影響を見比べ、現在のデスク環境の評価+改善するためのアドバイスを診断・提供します。

## 機能候補
【MVPまでに実装したい機能】  
- ユーザー登録
- ユーザー登録編集
- 通常ログイン
- ソーシャルログイン（Googleアカウント）
- 診断機能 
- 診断結果一覧
- 診断結果詳細
- 楽天商品提案
- マルチ検索機能
- 作業環境集計結果のグラフ化
- SNS(X)へのシェア機能
- お気に入り機能
- お気に入り一覧

【本リリースまでに実装したい機能】
- タイトルを動的に変更
- パスワードリセット
- 利用規約・プライバシーポリシー・お問い合わせフォームの作成
- 管理者画面

## 技術選定
### バックエンド
- Ruby 3.2.2
- Rails 7.0.8

### フロントエンド
- TailwindCSS
- JavaScript

### 外部API
- Google Cloud Vision API
- DeepLe API
- OpenAI(ChatGPT API)
- 楽天API

### インフラ
- Docker
- PostgreSQL
- Render
- AWS(S3)

### 画面遷移図
https://www.figma.com/file/RtXfFzgb5Kv5jDAYeDkDv3/Diagnosis-at-Desk?type=design&node-id=0%3A1&mode=design&t=w3z7OguGZTSmxozd-1

### ER図 
[![Image from Gyazo](https://i.gyazo.com/75f36072a4a3f07b1d455d3f6b7c0259.png)](https://gyazo.com/75f36072a4a3f07b1d455d3f6b7c0259)