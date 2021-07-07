# テーブル設計

## users テーブル

| Column              | Type       | Options  |
| ------------------- | ---------- | -------- |
| nickname            | string     | NOT NULL |
| email               | string     | NOT NULL |
| password            | string     | NOT NULL |
| first_name          | string     | NOT NULL |
| last_name           | string     | NOT NULL |
| first_name_kana     | string     | NOT NULL |
| last_name_kana      | string     | NOT NULL |
| birthday            | string     | NOT NULL |

### Association

has_many :products
has_many :orders
has_many :comment

## products テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| user_id                   | string     | NOT NULL |
| image                     | references |          |
| name                      | string     | NOT NULL |
| description               | text       | NOT NULL |
| category_id               | references | NOT NULL |
| delivery_id               | references | NOT NULL |
| area_id                   | references | NOT NULL |
| delivery_day_id           | references | NOT NULL |
| status_id                 | references | NOT NULL |
| price                     | string     | NOT NULL |

### Association
has_many :comments
belongs_to :user
belongs_to :order
belongs_to :category
belongs_to :status
belongs_to :deliver
belongs_to :area
belongs_to :deliveryday

## categorys テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| product_id                | references | NOT NULL |
| name                      | string     | NOT NULL |

### Association

belongs_to :product

## status テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| product_id                | references | NOT NULL |
| name                      | string     | NOT NULL |

### Association
belongs_to :product

### delivers テーブル

| Column                        | Type       | Options  |
| ----------------------------- | ---------- | -------- |
| product_id                    | references | NOT NULL |
| delivery                      | string     | NOT NULL |

### Association
belongs_to :product

## area テーブル

| Column                         | Type       | Options  |
| ------------------------------ | ---------- | -------- |
| product_id                     | references | NOT NULL |
| area_name                      | string     | NOT NULL |

### Association
belongs_to :product

## deliverydays テーブル

| Column                            | Type       | Options  |
| --------------------------------- | ---------- | -------- |
| product_id                        | references | NOT NULL |
| delivery_day                      | string     | NOT NULL | 

### Association
belongs_to :product

## orders テーブル

| Column                    | Type       | Options  |
| ------------------------- | ---------- | -------- |
| user_id                   | references | NOT NULL |
| product_id                | references | NOT NULL |
| card_number               | string     | NOT NULL |
| card_exp                  | string     | NOT NULL |
| card_security             | string     | NOT NULL |
| post_code                 | string     | NOT NULL |
| prefecture                | string     | NOT NULL |
| municipality              | string     | NOT NULL |
| building_name             | string     | NULL     |
| phone_number              | string     | NOT NULL |

### Association
has_many :shippinginformations
belongs_to :user
belongs_to :product

## shippinginformations テーブル

| Column                          | Type       | Options  |
| ------------------------------- | ---------- | -------- |
| prefecture_id                   | references | NOT NULL | 
| municipality_id                 | references | NOT NULL |
| address_id                      | references | NOT NULL |
| building_name_id                | references | NOT NULL |
| phone_number                    | references | NOT NULL |

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



