# テーブル設計

## users テーブル

| Column           | Type        | Options             |
| ---------------- | ----------- | ------------------- |
| email            | string      | null: false         |
| password         | string      | null: false         |
| nickname         | string      | null: false         |
| first_name       | string      | null: false         |
| last_name        | string      | null: false         |
| first_name(kane) | string      | null: false         |
| last_name(kane)  | string      | null: false         |
| birth_year       | date        | null: false         |
| birth_month      | date        | null: false         |
| birth_day        | date        | null: false         |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column               | Type        | Options                          |
| -------------------- | ----------- | -------------------------------- |
| product_name         | string      | null: false                      |
| product_price        | integer     | null: false                      |
| product_description  | text        | null; false                      |
| user                 | references  | null: false,foreign_key: true    |

### Association

- belongs_to :buyer
- belongs_to :user

## buyers テーブル

| Column       | Type        | Options                          |
| ------------ | ----------- | -------------------------------- |
| user         | references  | null: false, foreign_key: true   |
| item         | references  | null: false, foreign_key: true   |

### Association

- has_many :items
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_code      | integer     | null: false                    |
| phone_number     | integer     | null: false                    |
| municipality     | text        | null: false                    |
| address          | text        | null: false                    |
| building_name    | text        | null: false                    |
| buyer            | references  | null: false, foreign_key: true |

### Association

- belongs_to :buyer