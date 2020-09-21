# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password-confirmation | string | null: false |
| first-name | string | null: false |
| last-name | string | null: false |
| first-name-kana | string | null: false |
| last-name-kana | string | null: false |
| birth-date | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name | string | null:false|
| info | text | null: false |
| category | string | null: false |
| sales-status | string | null: false |
| shipping-fee | string | null: false |
| prefecture | string | null: false |
| scheduled-delivery | string | null: false |
| price | string | null: false |
| user | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card-number   | string | null: false |
| card-exp-month   | string | null: false |
| card-exp-year | string | null: false |
| card-cvc | string | null: false |
| postal-code | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string |  |
| phone-number | string | null: false |
| postal-code | string | null: false |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

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