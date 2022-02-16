## プロジェクト名

- Toripan

現在Heroku上のサーバーなので画像が一定時間経つと表示されなくなります。

後日サーバーを変更予定です。
***
## アプリケーション概要

- パンの予約Webアプリケーション
***
## URL

- https://toripan.herokuapp.com/
***
## テスト用アカウント

- Basic認証
  - username: t0ripAn
  - password: adm1nApir0t

- Admin
  - email: adminnansuca@exmaple.jp
  - password: iSOmaru0butter

- 一般ユーザー
  - email: testuser@test.com
  - password: 66test
***
## 利用方法
#### 管理者
- 商品登録
  - トップページのヘッダー「商品登録」から商品登録を行う
  - 商品画像、商品名、商品説明、カテゴリー、販売価格、在庫(予約可能数)を入力し、登録
- 商品編集
  - トップページのヘッダー「商品一覧」から一覧ページへ遷移
  - 画像をクリックし、詳細画面へ遷移すると編集ボタン、削除ボタンが表示される
  - 編集ボタンをクリックし、商品画像、商品名、商品説明、カテゴリー、販売価格、在庫(予約可能数)を入力し、登録
- 商品削除
  - トップページのヘッダー「商品一覧」から一覧ページへ遷移
  - 画像をクリックし、詳細画面へ遷移すると編集ボタン、削除ボタンが表示される
  - 削除ボタンをクリックし、販売終了商品や取り扱い終了商品を削除
***
## アプリケーションを作成した背景
ご予約のハードルを下げて、多くのお客様にパンをお楽しみいただけるようにするためです。

前職で働いていた頃からパンの予約をInstgramで行ってました。

お客様の中にはご年配の方や、Instagramでハッキングされた過去があるお客様もおり、

ご予約をご利用いただけないお客様もいらっしゃいました。

パンの予約サイトも探していましたが、痒いところに手が届かない仕様がありました。

最終的な実装ではそれらを補ったアプリケーションです。
***
## 洗い出した要件
https://docs.google.com/spreadsheets/d/1l2fZbjca_oFqyd7QZ-imrumt2JikuUGyae6dKnfYkQE/edit?usp=sharing
***
## 実装した機能についての画像やGIF及び説明
[![Image from Gyazo](https://i.gyazo.com/891a51651242c78dc97f90ef175dc626.gif)](https://gyazo.com/891a51651242c78dc97f90ef175dc626)

- Adminユーザーのみ商品登録可能
- 一般ユーザーのみ予約可能
***
## DB設計
[![Image from Gyazo](https://i.gyazo.com/8a300936fe783b5e744a42e2ebbc593a.png)](https://gyazo.com/8a300936fe783b5e744a42e2ebbc593a)
***
## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/251094fb6378edde8235fbaa28887841.png)](https://gyazo.com/251094fb6378edde8235fbaa28887841)
***
## 開発環境

***
## ローカルでの動作環境
後日記述予定
***
## 工夫したポイント
後日記述予定
***
## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| lastname           | string  | null: false |
| firstname          | string  | null: false |
| phonenumber        | string  | null: false |
| admin              | boolean |             |

## Association
- has_one :cart, dependent: :destroy
- has_many :reservations
- has_many :room_users
- has_many :messages
- has_many :comments 

## itemsテーブル

| Column      | Type       | Options           |
| ----------- | ---------  | ----------------- |
| name        | string     | null: false       |
| text        | string     | null: false       |
| category_id | integer    | null: false       |
| price       | integer    | null: false       |
| stock       | integer    | null: false       |
| user        | references | foreign_key: true |

## Association

- has_many :cart_items, dependent: :destroy
- has_many :item_categories
- has_many :comments
- has_many :item_allergies

## cartsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- has_many :items, through: :cart_items

## cart_itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| cart_id     | references | null: false, foreign_key: true |


## Association

- belongs_to :item
- belongs_to :cart

## reservationsテーブル

| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| date_time_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| total_price  | integer    | null: false                    |


## Association

- belongs_to : user
- has_many :reservation_detail_histories

## reservation_detail_historiesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| reservation_id | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| num            | integer    | null: false                    |


## Association

- belongs_to : item
- belongs_to :reservation

## item_categoriesテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| item_id     | integer | null: false |
| category_id | integer | null: false |


## Association

- belongs_to : item
- belongs_to : category

## categoriesテーブル

| Column      | Type | Options     |
| ----------- | ---- | ----------- |
| name        | name | null: false |


## Association

- has_many : item_categories

## room_usersテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| room_id | integer | null: false |


## Association

- belongs_to : room

## roomsテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |


## Association

- has_many : rooms
- has_many : messages

## messagesテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| content | string  | null: false |
| user_id | integer | null: false |
| room_id | integer | null: false |


## Association

- belongs_to : user
- belongs_to : room

## commentsテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| text    | string  | null: false |


## Association

- belongs_to : user
- belongs_to : item

## item_allergiesテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| item_id    | integer | null: false |
| allergy_id | integer | null: false |


## Association

- belongs_to : item
- belongs_to : allergy

## allergiesテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |


## Association

- has_many : item_allergies
