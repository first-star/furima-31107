# DB 設計


## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| nickname           | string              | null: false, unique: true  |
| email              | string              | null: false, unique: true  |
| encrypted_password           | string              | null: false                |
| family_name        | string              | null: false                |
| first_name         | string              | null: false                |
| family_name_kana   | string              | null: false                |
| first_name_kana    | string              | null: false                |
| birthday           | date                | null: false                |

### Association

* has_many :items
* has_many :purchases



## sending_destinations table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| post_code                    | string       | null:false                     |
| prefecture_id                | integer      | null:false                     |
| city                         | string       | null:false                     |
| house_number                 | string       | null:false                     |
| building_name                | string       |
| phone_number                 | string       | null: false, unique: true      |
| purchases                    | references   | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to_active_hash :prefecture
* belongs_to :purchases




## items table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| name                         | string       | null: false                    |
| explanation                  | text         | null: false                    |
| category_id                  | integer      | null: false, foreign_key: true |
| condition_id                 | integer      | null: false,foreign_key: true  |
| price                        | integer      | null: false                    |
| postage_id                   | integer      | null: false                    |
| prefecture_id                | integer      | null: false                    |
| prepare_id                   | integer      | null: false, foreign_key: true |
| user                         | references   | null: false, foreign_key: true |


### Association

* belongs_to_active_hash :prefecture
* belongs_to :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :postage
* belongs_to_active_hash :prepare
* has_one :purchases
* belongs_to :user




## purchases table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| item                         | references   | null: false, foreign_key:true  |
| user                         | references   | null: false, foreign_key:true  |


### Association

* belongs_to :item
* belongs_to :user
* has_one :sending_destination


