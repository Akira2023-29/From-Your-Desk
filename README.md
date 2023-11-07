## サービス名（未定）

## サービス概要
在宅でデスクワークをする人は「どうすれば作業効率が上げられるか」、「どうすれば自分の納得のいく空間にできるか」等、様々な試行錯誤を繰り返したかと思います。そんなデスクには「その人らしさ」が自然と表れています。このアプリはデスク環境からその人の性格を診断・共有することで在宅ワーカーと交流を深めるサービスです。  

## このサービスへの思い・作りたい理由
前職はオフィス空間（働く空間）を提案・提供する業界で働いており、様々な働き方改革を間近で見てきました。
中でも一番大きな変化として、リモートワークの導入が世の中で大きく進んだということが挙げられます。
私自身も約3年ほどリモートワークをしました。
「いかに出社時より生産性を下げないか」「どうすれば自分の好みにカスタマイズできているか」等を皆で考えて試行錯誤しました。
多くの方のデスク環境を見てきましたが、自然とその人の個性（らしさ）がデスク環境に表れていると感じました。

現在は前職を退社し、次の会社でもリモートワークで働くために（家庭の事情でフルリモートで働く必要があるため）転職目指しプログラミングの勉強をしています。
そんな中、最近プログラミング学習をしながら思うことがあります。  
「自分と同じプログラミング学習をしている方のデスク環境はどうなっているのだろう・・？」  
おそらく同じことを思った方も多いと思います。  
しかし、 長い時間過ごしてきたデスク環境にはきっと「その人らしさ」が表れていると考えたことはあまり無いかと思います。   
また、在宅ワーカーは外での交流が少ない分、各々のデスク環境について見せながら語る機会もなかなな無いのではと感じました。
そこで、デスク写真を性格診断結果と共にシェアする場があれば新たな在宅ワーカーの交流の場になるのではと思い、このサービスを考えました。
 
## ユーザー層について
- **自宅でデスクワークしている方**  
本サービスはデスク環境から性格診断を提供します。

- **デスクワーク仲間のデスク環境が気になる方**  
本サービスはデスク環境の写真も診断結果と共にシェアすることで他の方のデスク環境が見れます。
もしかすると自分のセンスに合ったデスク環境に出会えるかもしれません。
そのデスク環境で作業されている方の性格と自分の性格を比べてみてください。

## サービスの利用イメージ
- **デスク環境の写真から性格診断。**    
デスク写真を撮ってアップするだけで、簡単に自身の性格診断ができます。
何かアンケートに答える必要はありません。

- **診断結果とデスク環境の写真をSNSでシェア。**   
デスク環境整備は一度終わるとなかなか変更する機会がありませんが、思わず導入したいデスク環境に出会えたりアドバイスをコメントでもら得ることで、デスク環境改善・生産性向上につながります。  
また、他の方がシェアした中から自分好みのデスク環境に出会えます。

## ユーザーの獲得について
- **自宅でデスクワークしている方**  
　RUNTEQ生に対して、X(旧twitter）やMattermostを通じて拡散したいと考えています。

- **デスクワーク仲間のデスク環境が気になる方**   
　こちらもまずはRUNTEQ生に向けて、X(旧twitter）やMattermostを通じた拡散を考えてます。

## サービスの差別化ポイント・推しポイント
- **デスク環境の診断方法について**  
　デスク周りの状況から性格診断をする方法として、整理整頓具合や実際に置いている物からその人の性格を診断するような記事はありましたが、今回はデスク環境の **「色バランス」** からその人の性格を診断します。画像解析APIを使用しデスク環境写真の色配分を調べて、その色のバランスからその方の性格を導き出します。

- **写真のシェアについて**  
　デスク環境の写真についてはネットで検索すればたくさん出てきますが、自分の現状と比べてあまり参考にならない「かなりの金額を投資したおしゃれな写真」や「かっこいいゲーミング用のデスク写真」が多く、どうしてもそれらに目が行きがちになると思います。「実際のところ自分と同じプログラミング学習をしてる仲間達のデスク環境ってどうなの？」という疑問を解決する場も案外少ないです。今回考えているサービスでは性格診断に加えて、デスク環境の写真も共有できます。自分に近い環境の仲間が多いため、「参考・共感」できるデスク環境に出会える確率が高いです。

## 機能候補
【MVPまでに実装したい機能】  
- ユーザー登録  
- ログイン  
- 診断機能  
- 投稿一覧（デスク写真と診断結果をコンテンツとして一覧表示）
- 投稿詳細（デスク写真・診断結果）
- 編集機能（主にユーザー情報）  
- SNS(X)へのシェア機能（診断結果）
  
【本リリースまでに実装したい機能】  
- 診断機能の拡充（性格以外も診断する。例：その人の歩んできた人生も色情報から導き出す。）  
- 色配分別のデスク写真のジャンル分け  
- 検索機能（検索項目は検討中）   
- いいね機能  

## 機能の実装方針予定
【診断機能】
以下のフローで色情報を取得し、性格診断結果を出す予定です。  
- Google Cloud Vision APIでアップロードした画像を解析。
  - プロパティ情報の中の「color」に関するデータだけ使う。
- 解析結果（JSONデータ）からcolor情報を取得。  
- 取得したcolor情報をChatGPT_APIに渡して診断結果を出してもらう。  
  - 各色に対してどのような性格かを設定しておく。  
  - 色配分からChatGPTが性格を導き出す。
- Google Cloud Vision で画像から色情報（割合）を出す様子（無料お試しページより）
[![Image from Gyazo](https://i.gyazo.com/d3a85b2eeccf34e1a029babd9174daee.png)](https://gyazo.com/d3a85b2eeccf34e1a029babd9174daee)
- 画像から返されるJSONデータの中のcolor情報部分（一部抜粋）
```
    "dominantColors": {
      "colors": [
        {
          "color": {
            "blue": 174,
            "green": 154,
            "red": 106
          },
          "hex": "6A9AAE",
          "percent": 26.81794213817742,
          "percentRounded": 27,
          "pixelFraction": 0.014795731,
          "rgb": "106, 154,\n 174",
          "score": 0.22608566
        },
        {
          "color": {
            "blue": 200,
            "green": 229,
            "red": 246
          },
          "hex": "F6E5C8",
          "percent": 14.174644005030618,
          "percentRounded": 14,
          "pixelFraction": 0.07994111,
          "rgb": "246, 229,\n 200",
          "score": 0.11949775
        },
```
- 実際にChatGPTで実践したデモ結果（条件として各色毎の性格等の初期設定を設け、JSON形式の色情報を渡した）
  [![Image from Gyazo](https://i.gyazo.com/b2a664f4e810b620ce5d6ca36f5fe425.png)](https://gyazo.com/b2a664f4e810b620ce5d6ca36f5fe425)

【ログイン機能】  
sorcery を使って実装したいと考えています。  

【Xへのシェア機能】  
Rails応用で学んだAPIを使わない方法で実装を考えています。  
診断結果を共有して、投稿したデスク写真はリンクから見れるようにする予定です。

### 画面遷移図
https://www.figma.com/file/RtXfFzgb5Kv5jDAYeDkDv3/Diagnosis-at-Desk?type=design&node-id=0%3A1&mode=design&t=w3z7OguGZTSmxozd-1

### ER図
[![Image from Gyazo](https://i.gyazo.com/69ebd3376e1b56dba473b1f338b78c96.png)](https://gyazo.com/69ebd3376e1b56dba473b1f338b78c96)