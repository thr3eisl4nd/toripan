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

- has_many :items
- has_many :reservations
- has_many :room_users
- has_many :messages
- has_many :comments 

## itemsテーブル

| Column      | Type    | Options     |
| ----------- | ------  | ----------- |
| name        | string  | null: false |
| text        | string  | null: false |
| category_id | integer | null: false |
| price       | integer | null: false |
| stock       | integer | null: false |

## Association

- belongs_to : user
- has_many :item_categories
- has_many :comments
- has_many :item_allergies

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
