# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| name                | string    | null: false                    |
| info                | text      | null: false                    |
| category            | string    | null: false                    |
| sales_status        | string    | null: false                    |
| shipping_fee_status | string    | null: false                    |
| item_prefecture     | string    | null: false                    |
| scheduled_delivery  | string    | null: false                    |
| price               | string    | null: false                    |
| user                | reference | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user



## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :shipping_aderess
- belongs_to :user
- belongs_to :item



## shipping_adressesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false,                   |
| city         | string     | null: false,                   |
| adresses     | string     | null: false,                   |
| building     | string     |                                |
| phone_number | string     | null: false,                   |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order