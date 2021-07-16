# テーブル設計

## users テーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| first_name          | string     | null: false               |
| last_name           | string     | null: false               |
| first_name_kana     | string     | null: false               |
| last_name_kana      | string     | null: false               |
| birthday            | date       | null: false               |

### Association

has_many :products
has_many :orders
has_many :comment

## products テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| name                      | string     | null: false                    |
| description               | text       | null: false                    |
| category_id               | integer    | null: false                    |
| delivery_id               | integer    | null: false                    |
| area_id                   | integer    | null: false                    |
| delivery_day_id           | integer    | null: false                    |
| status_id                 | integer    | null: false                    |
| price                     | integer    | null: false                    |

### Association
has_one :order
has_many :comments
belongs_to :user

## orders テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| product                | references | null: false, foreign_key: true|

### Association
has_one :shippinginformation
belongs_to :user
belongs_to :product

## shippinginformations テーブル

| Column                          | Type       | Options                        |
| ------------------------------- | ---------- | ------------------------------ |
| order                           | references | null: false, foreign_key: true |
| post_code                       | string     | null: false                    |
| area                            | integer    | null: false                    |
| municipality                    | string     | null: false                    |
| address                         | string     | null: false                    |
| building_name                   | string     |                                |
| phone_number                    | string     | null: false                    |

### Association
belongs_to :order

## comments テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| product                   | references | null: false, foreign_key: true |
| comment                   | text       | null: false                    |

### Association
belongs_to :user
belongs_to :product



