# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| nickname           | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| birthday           | date        | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column               | Type        | Options                          |
| -------------------- | ----------- | -------------------------------- |
| product_name         | string      | null: false                      |
| product_price        | integer     | null: false                      |
| product_description  | text        | null; false                      |
| category_id          | integer     | null: false                      |
| product_condition_id | integer     | null; false                      |
| shipping_charge_id   | integer     | null: false                      |
| shipping_area_id     | integer     | null; false                      |
| days_to_ship_id      | integer     | null; false                      |
| user                 | references  | null: false,foreign_key: true    |

### Association

- has_one :purchase_history
- belongs_to :user

## purchase_history テーブル

| Column       | Type        | Options                          |
| ------------ | ----------- | -------------------------------- |
| user         | references  | null: false, foreign_key: true   |
| item         | references  | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | string      | null: false                    |
| phone_number     | string      | null: false                    |
| municipality     | string      | null: false                    |
| address          | string      | null: false                    |
| building_name    | string      |                                |
| prefecture_id    | integer     | null: false                    |
| purchase_history | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history