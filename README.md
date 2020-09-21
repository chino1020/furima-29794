# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| first-name | string | null: false |
| last-name | string | null: false |
| first-name-kana | string | null: false |
| last-name-kana | string | null: false |
| birth-date | date | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null:false|
| info | text | null: false |
| category | integer | null: false |
| sales-status | integer | null: false |
| shipping-fee | integer | null: false |
| prefecture | integer | null: false |
| scheduled-delivery | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal-code | string | null: false |
| prefecture | integer | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string |  |
| phone-number | string | null: false |
| postal-code | string | null: false |


### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## sold_outテーブル
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |