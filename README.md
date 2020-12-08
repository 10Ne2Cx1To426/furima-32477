# データベース設計

## Usersテーブル

| Column                  | Type    | Options                   |
|-------------------------|---------|---------------------------|
| nickname                | string  | null: false               |
| email                   | string  | null: false, unique: true |
| encrypted_password      | string  | null: false               |
| first_name              | string  | null: false               |
| last_name               | string  | null: false               |
| first_name_k            | string  | null: false               |
| last_name_k             | string  | null: false               |
| birth                   | date    | null: false               |

### Association
has_many :items
has_many :buy_records

## Itemテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :category_id
belongs_to :condition_id
belongs_to :delivery_fee_id
belongs_to :prefecture_id
belongs_to :delivery_day_id
has_one :buy_record

## Buy_recordテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## Shipping_addressテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_cord   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| buy_record    | references | null: false, foreign_key: true |


### Association
belongs_to :buy_record
belongs_to :prefecture_id
