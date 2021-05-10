# アプリ名
* Post CMS

# 本番環境
* http://www.post-cms.net

# 概要
WordPressのように、文章を書き、公開することができるCMSです。
WordPressでは記事を書く、保存することしかできませんが、こちらのCMSでは、
記事を発注する、応募する、納品する、検修するなど、
記事を作成していく上で必要な機能を一通り揃えています。

現状は未実装ですが、将来的にチャット機能をもうけ、
ユーザー側と管理者側がチャットでコミュニケーションを取れるようにし、
記事発注、作成、公開、コミュニケーションを一本化できるようなWebアプリケーションにしたいと考えております。

# 制作背景
自身で初めて一からWebのアプリケーションを作成するにあたり、ただデータを登録して表示するだけの簡単なアプリケーションではなく、
プログラミングスクールを卒業したばかりの自分には難しいと感じるレベルの機能を実装していきたいと思い、
管理者側とユーザー側で権限を分け、ユーザー側ができることを制限したWebアプリケーションを作成することを決めました。

また、前々職がWebメディアということもあり、馴染みが深かったので、今回のようなCMS形式のアプリケーションを作成いたしました。

# 本番環境(ユーザー側のサインイン画面)
* http://www.post-cms.net/users/sign_in

### テスト用ログイン情報（Basic認証）
* ユーザー名：postcmsuser
* Password：testpostcms

### テスト用ログイン情報（ユーザーアカウント）
* Email：test@test.com
* Password：testuser1

# 本番環境(管理者側のサインイン画面)
* http://www.post-cms.net/admins/sign_in

### テスト用ログイン情報（Basic認証）
* ユーザー名：postcmsuser
* Password：testpostcms

### テスト用ログイン情報（管理者権限アカウント）
* Email：test2@test.com
* Password：testuser2

# DEMO
### ユーザー登録ページ

![d5ada7e0534b0a33a86056d19173f2d0.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/f3582f99-b35b-929b-fc3f-03fc7895e2c1.gif)

こちらがユーザー登録画面です。管理者側とユーザー側でビューを分けております。
また勝手に登録がされないようにBasic認証も導入しております。

![d3c5060d319ceae5019ec80b32e84866.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/c0e9012d-dae1-8ac0-4273-12432c0571ec.gif)


### 発注画面


![order.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/e911f044-7044-afa2-281d-228091400955.gif)

こちらが発注画面です。
CSV形式でデータベースにデータを登録します。

![order_delete.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/d972d7ad-3ce2-f816-6535-5a144f6ff542.gif)

すでに登録されているデータはこちらのように削除もできます。

![download.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/a2c46981-8042-4d7d-fb8a-dc4a2dca8b69.gif)

元となるCSVは上記の画像にある発注テンプレートをダウンロードするというボタンを押すことで、
ダウンロードができるようになっております。

![redirect.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/b09813cf-1cd7-bef7-98fc-aad5a6f824f3.gif)

また、こちらは管理者側しか閲覧できないように設定しており、ユーザー側がアクセスしようとすると、
リダイレクトがされるように設定しております。

### 応募画面

![apply_new.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/fa7052bf-940b-4567-0039-a35676ae6399.gif)

こちらが応募画面です。
発注がされた記事に対して応募ができるようになっております。

![apply.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/a740ffa5-f720-db4e-d564-af84cdf9e125.gif)

応募がされた記事に関しては、他の方が応募できないように、一覧から削除されるとともに、
応募のアクションができないようにリダイレクトをかけております。

![apply_delete.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/67412484-3dbf-8346-2921-e7b5afa7f2dd.gif)

また、自分が何の記事に応募したかが一覧表示で確認できる画面も実装し、
そこのページで応募のキャンセルができるようになっております。
応募がキャンセルされた記事は再び応募可能記事一覧に表示され、応募ができるようになります。

### 記事執筆画面

![post_edit.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/5807a00a-937d-a070-8150-0ffc24a483cc.gif)

こちらが記事執筆画面です。応募した記事を実際に書くことができます。
エディターはAction Textを使用しております。
更新するボタンを押すことで、書いている記事の内容が保存されます。

![post_deliver.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/471b2c07-0293-678f-7e9e-e45f8e66e0ac.gif)

記事を納品するというボタンを押すことで、記事を納品することができます。
この時、記事のステータスを下書き状態から検修待ち状態にする処理を行っております。
この処理を行うことで。管理者側が検修することができるようになります。

### 記事検修画面

![delivered.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/027396a6-eafc-a5fd-f213-f036d0e93cac.gif)

こちらが記事検修画面です。応募した記事をチェックし、公開または差し戻しを行います。

![decline.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/f4b2faa3-0047-d0bb-df7f-43a967f97579.gif)

差し戻しボタンを押すことで、書いている記事をユーザー側に差し戻しを行うことができます。
差し戻しをされた記事は検修待ち状態から、下書き状態になり、再びユーザー側が記事の変更、納品ができるようになります。

![publish.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/ef3fb5ee-8a32-4205-ce96-4224f3e4cca5.gif)

記事を公開するというボタンを押すことで、記事を公開することができます。
この時、記事のステータスを検修待ち状態から公開状態にする処理を行っております。

![show.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/753344/5859cec4-b119-53bc-fca1-815ab0562ca7.gif)

公開された記事は公開記事一覧画面から確認できます。


# 工夫したポイント
* BootStrap製のテンプレートを使用し、コードの記述を少なくしたところ
* ユーザー側と管理者側で権限を分け、ユーザー側ができることを制限したところ
* 記事の発注をCSVでできるようにしたところ
* 記事の検修機能を実装し、公開や差し戻し処理を行えるようにしたところ

# 開発環境
### バックエンド
* Ruby
* Ruby on Rails 

### フロントエンド
* HTML・CSS
* BootStrap
* JavaScript
* JQuery

### データベース
* MySQL
* SequelPro

### インフラ
* AWS

### Webサーバー（本番環境）
* nginx

### アプリケーションサーバー（本番環境）
* unicorn

### ソース管理
* GitHub
* GitHubDesktop

### テスト
* Rspec

### エディタ
* VSCode

# 今後実装したい機能や現状の課題
* ユーザー側と管理者側でチャットをできるようにし、気軽にコミュニケーションが取れるような環境を構築する
* 記事の納品時にバリデーションをかけ、適当な記事が納品できないようにする（テーマに沿ってない記事ができないようにする）
* 非アクティブなユーザーを削除できるようにする、などのユーザー管理周りの実装
* サイトのSSL化
* JavaScriptとJQuery周りを整理し、もっと有用に活用できるようにする

# DB設計

## users テーブル

| Column          | Type        | Options      |
|:----------------|------------:|:------------:|
| nickname        | string      | null:false   |
| email           | string      | null:false   |
| password        | string      | null:false   |
| status          | integer     | null:false   |

### Association

- has_many :posts
- has_many :applies

## admins テーブル

| Column          | Type        | Options      |
|:----------------|------------:|:------------:|
| nickname        | string      | null:false   |
| email           | string      | null:false   |
| password        | string      | null:false   |
| status          | integer     | null:false   |

### Association

- has_many :orders


## posts テーブル

| Column              | Type       | Options                        |
|:--------------------|-----------:|:------------------------------:|
| title               | text       |                                |
| publish_date        | integer    |                                |
| post_status         | integer    |                                |
| user_id             | references | null: false, foreign_key: true |
| order_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user

## orders テーブル

| Column                | Type       | Options                        |
|:----------------------|-----------:|:------------------------------:|
| title                 | text       | null: false                    |
| first_keyword         | string     | null: false                    |
| second_keyword        | string     | null: false                    |
| third_keyword         | string     | null: false                    |
| fourth_keyword        | string     | null: false                    |
| fifth_keyword         | string     | null: false                    |
| words                 | integer    | null: false                    |
| price                 | integer    | null: false                    |


### Association

- has_one :post
- has_one :apply
- belongs_to :admin

## applies テーブル

| Column              | Type       | Options                        |
|:--------------------|-----------:|:------------------------------:|
| user_id             | references | null: false, foreign_key: true |
| order_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

