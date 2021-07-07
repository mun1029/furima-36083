# テーブル設計

## users テーブル

| Column              | Type       | Options                |
| ------------------- | ---------- | ---------------------- |
| nickname            | string     | NOT NULL               |
| email               | string     | NOT NULL, unique: true |
| encrypted_password  | string     | NOT NULL               |
| first_name          | string     | NOT NULL               |
| last_name           | string     | NOT NULL               |
| first_name_kana     | string     | NOT NULL               |
| last_name_kana      | string     | NOT NULL               |
| birthday            | date       | NOT NULL               |

### Association

has_many :products
has_many :orders
has_many :comment

## products テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| user_id                   | references | NOT NULL |
| name                      | string     | NOT NULL |
| description               | text       | NOT NULL |
| category_id               | integer    | NOT NULL |
| delivery_id               | integer    | NOT NULL |
| area_id                   | integer    | NOT NULL |
| delivery_day_id           | integer    | NOT NULL |
| status_id                 | integer    | NOT NULL |
| price                     | integer    | NOT NULL |

### Association
has_one :order
has_many :comments
belongs_to :user

## orders テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| user_id                   | references | NOT NULL |
| product_id                | references | NOT NULL |

### Association
has_one :shippinginformations
belongs_to :user
belongs_to :product

## shippinginformations テーブル

| Column                          | Type       | Options  |
| ------------------------------- | ---------- | -------- |
| orders_id                       | string     | NOT NULL |
| post_code                       | string     | NOT NULL |
| prefecture                      | string     | NOT NULL |
| municipality                    | string     | NOT NULL |
| address                         | string     | NOT NULL |
| building_name                   | string     | NULL     |
| phone_number                    | string     | NOT NULL |

### Association
belongs_to :order

## comments テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| user_id                   | references | NOT NULL |
| product_id                | references | NOT NULL |
| comment                   | text       | NOT NULL |

### Association
belongs_to :user
belongs_to :product



