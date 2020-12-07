## usersテーブル

| Column                | Type    |    Options                |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birthday              |  date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type      | Options                       |
|--------------------|-----------|-------------------------------|
| product_name       | text      | null: false                   |
|product_description | text      | null: false                   |
| category           | string    | null: false                   |
| status             | string    | null: false                   |
| shipping_charges   | string    | null: false                   |
| shipping_area      | string    | null: false                   |
| days_to_ship       | string    | null: false                   |
| selling_price      | integer   | null: false                   |
| user_id            | references| null: false, foreign_key: true|

### Association
-has_one :purchase
_belongs_to :user

## purchasesテーブル

| Column              |Type      |Options                        |
|---------------------|----------|-------------------------------|
|card_information     |string    | null: false                   |
|expiration_date_month|integer   | null: false                   |
|expiration_date_year |integer   | null: false                   |
|security_code        |integer   | null: false                   |
|user_id              |references| null: false, foreign_key: true|
|item_id              |references| null: false, foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item
_has_one :shipping_address

## shipping_addressesテーブル
|Column       |Type      |Options                        |
|-------------|----------|-------------------------------|
|postal_code  |string    | null: false                   |
|prefectures  |string    | null: false                   |
|municipally  |string    | null: false                   |
|address      |string    | null: false                   |
|building_name|string    |                               |
|purchase_id  |references| null: false, foreign_key: true|

### Association
-belongs_to purchase