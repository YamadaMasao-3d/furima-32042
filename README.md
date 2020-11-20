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
| category             | integer     | null: false                      |
| product_condition    | integer     | null; false                      |
| shipping_charges     | integer     | null: false                      |
| shipping_area        | integer     | null; false                      |
| days_to_ship         | integer     | null; false                      |
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

- has_many :users
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
| prefectures      | integer     | null: false                    |
| purchase_history | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history