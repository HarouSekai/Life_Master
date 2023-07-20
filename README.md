# アプリケーション名
Life_Master


# アプリケーション概要
文章や画像を使ってあらゆるアイデアを出し合うことで、個人、家庭、社会をより良いものにすることができる。


# URL
https://life-master.onrender.com/


# テスト用アカウント
* メールアドレス：test@email<br>
* パスワード：pass1234


# 利用方法

## 記事の作成

1. トップページ（記事一覧ページ）のヘッダーから新規登録ページに進み、ユーザー新規登録を行う

2. ヘッダーの新規作成ボタンを押し、記事作成ページに進む

3. タイトル、サマリーを入力し、保存ボタンを押す

4. 段落を追加する場合は、「段落を追加」ボタンを押し、見出し（任意）、本文（任意）を入力した後、保存ボタンを押す

5. 画像を追加する倍は、段落編集ページの「画像を追加」ボタンを押し、画像（必須）、画像の説明（任意）を入力した後、保存ボタンを押す

## 記事の編集

1. 記事一覧ページから編集したい記事のタイトルを押し、記事詳細ページに進む

2. タイトル・見出し・画像の横にある編集ボタンを押し、任意の部分を編集する

# アプリケーションを作成した背景
私は7年余り一人暮らしを経験し、その間に生活上のアイデアをいくつか編み出した。そして、それらのアイデアを多くの人に知ってもらいたいと考えていた。同時に、人々があらゆるアイデアを持ち寄れば、個人的、家庭的、社会的に新たな価値が誕生すると仮定した。そこで、文章や画像を投稿することでアイデアを発表するアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1JRbDY71gTuhDGhRW3pDavLwDgaZRleQ_kkupSTxst1E/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

## 記事作成機能

* ヘッダーにある「新規作成」ボタンを押すと記事作成画面に移動する。<br>
* タイトル、サマリーを入力した後、保存ボタンを押すと記事が作成される。<br>
* サマリーの入力フォームは改行を扱うことができる。<br>
* サマリーとタイトルを入力し、保存ボタンを押すと、記事編集ページに移動する。<br>

[![Image from Gyazo](https://i.gyazo.com/5dca3bb161feb3d5a2c3181261f0e38f.gif)](https://gyazo.com/5dca3bb161feb3d5a2c3181261f0e38f)

* 記事編集ページ下部にある「段落を追加」ボタンを押すと、段落作成ページに移動する。<br>
* 見出し（任意）、本文（任意）を入力し、保存ボタンを押すと、段落が作成される。<br>
* 段落作成ページの保存ボタンを押すと、記事編集ページに移動する。<br>

[![Image from Gyazo](https://i.gyazo.com/126abe49bbc26c46471cfb91518a0913.gif)](https://gyazo.com/126abe49bbc26c46471cfb91518a0913)

## 記事一覧機能

* トップページに記事が新しい順に一覧表示される。<br>
* それぞれの記事には、タイトル、作成者名、サマリーが表示される。タイトルとサマリーは最初の25文字までが表示される。<br>

[![Image from Gyazo](https://i.gyazo.com/8b06351f7a3f48938541ed61a078337a.png)](https://gyazo.com/8b06351f7a3f48938541ed61a078337a)

## 記事詳細機能

* トップページから任意の記事のタイトルを押すと、記事詳細ページに移動する。<br>
* 記事詳細ページには、タイトル、作成者名、更新日、サマリー、および記事の各段落が表示される。<br>
* サイドバーには、記事のタイトルと各段落の見出しへのリンクが表示される。<br>
* ログイン中のユーザーが記事の作成者の場合には、タイトルの横に編集ボタンと削除ボタン、各見出しの横に編集ボタンが表示される。<br>

[![Image from Gyazo](https://i.gyazo.com/057d48e614efa569a9e67a0e152ad7df.gif)](https://gyazo.com/057d48e614efa569a9e67a0e152ad7df)

## 記事編集機能

* 記事詳細ページにある編集ボタンを押すと、アウトライン（タイトル・サマリー）と各段落の編集ページに移動する。<br>
* フォームに入力し、保存ボタンを押すと記事の内容が更新され、記事編集ページに移動する。<br>

[![Image from Gyazo](https://i.gyazo.com/636dab55f773cb24d714ea94d7c3fdb1.gif)](https://gyazo.com/636dab55f773cb24d714ea94d7c3fdb1)

## 記事削除機能

* 記事詳細ページでタイトルの横にある削除ボタンを押すと記事が削除され、記事削除完了ページに移動する。<br>
* 記事削除完了ページでは、削除完了のメッセージ、トップページへのボタンが表示される。<br>

[![Image from Gyazo](https://i.gyazo.com/fea263639185ec2359ec4f67747d0936.gif)](https://gyazo.com/fea263639185ec2359ec4f67747d0936)

## その他の機能

* 段落削除機能<br>
* 画像作成機能<br>
* 画像編集機能<br>
* 画像削除機能<br>
* ユーザーマイページ（ユーザー情報の編集、ユーザーの削除、ユーザーが投稿した記事の一覧表示、アバター画像の作成・編集・削除）<br>
* アプリケーション紹介ページ<br>
[![Image from Gyazo](https://i.gyazo.com/9b74f7f3cd8ed94fbe9fc578a9897d15.gif)](https://gyazo.com/9b74f7f3cd8ed94fbe9fc578a9897d15)

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/8fe86bce7f17de3c94707ce98f1f3bd7.png)](https://gyazo.com/8fe86bce7f17de3c94707ce98f1f3bd7)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/7a92af7a21014e5dea9d666541732091.png)](https://gyazo.com/7a92af7a21014e5dea9d666541732091)

# 開発環境
* HTML<br>
* CSS<br>
* JavaScript<br>
* Sass<br>
* Ruby<br>
* Ruby on Rails<br>
* VSCode<br>
* WSL(Ubuntu)<br>
* GitHub<br>
* Render<br>

# ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/HarouSekai/Life_Master.git<br>
% cd Life_Master<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント

## レスポンシブデザインの採用
* デバイスの画面幅が一定以下の場合は、ヘッダー右側にハンバーガーボタンを表示し、クリックすると主要ページへのボタンが表示されるようにした。<br>

## 一覧画面のレイアウト維持
* 記事一覧画面のレイアウトが大きく崩れないようにするため、一覧画面には記事情報の文字数を制限して表示させた。<br>

## 記事を読みやすく
* 記事詳細ページでは、画面上に固定されたサイドバーにタイトルと見出しへのリンクを表示し、読みたい部分に素早くアクセスできるようにした。<br>