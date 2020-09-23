# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birth_date | date | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :sold_outs

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image | string | null: false |
| name | string | null: false|
| info | text | null: false |
| category_id | integer | null: false |
| sales_status_id | integer | null: false |
| shipping_fee_id | integer | null: false |
| prefecture_id | integer | null: false |
| scheduled_delivery_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :sold_out

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string |  |
| phone_number | string | null: false |
| sold_out | references | null: false, foreign_key: true |

### Association 
- belongs_to :sold_out

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## sold_outsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase