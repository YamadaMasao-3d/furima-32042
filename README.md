# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| email              | string      | null: false, unique: true |
| password           | string      | null: false               |
| encrypted_password | string      | null: false               |
| nickname           | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| birthday           | date        | null: false               |

### Association

- has_many :items
- has_many :purchase_history

## items テーブル

| Column               | Type        | Options                          |
| -------------------- | ----------- | -------------------------------- |
| product_name         | string      | null: false                      |
| product_price        | integer     | null: false                      |
| product_description  | text        | null; false                      |
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

- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | string      | null: false                    |
| phone_number     | string      | null: false                    |
| municipality     | text        | null: false                    |
| address          | text        | null: false                    |
| building_name    | text        |                                |
| buyer            | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history