# データベース設計

## Usersテーブル

| Column        | Type    | Options                   |
|---------------|---------|---------------------------|
| nickname      | string  | null: false               |
| email         | string  | null: false, unique: true |
| password      | string  | null: false               |
| first_name    | string  | null: false               |
| last_name     | string  | null: false               |
| first_name_k  | string  | null: false               |
| last_name_k   | string  | null: false               |
| birthday_year | integer | null: false               |

### Association
has_many :items
has_many :buy_records

## Itemテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item_name       | string     | null: false                    |
| image           |            |                                |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| prefecture      | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
belongs_to :user
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

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal_cord  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| phone_number | integer    | null: false                    |
| buy_record   | references | null: false, foreign_key: true |


### Association
belongs_to :buy_record
