# DB 設計


## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| nickname           | string              | null: false, unique: true  |
| email              | string              | null: false, unique: true  |
| password           | string              | null: false                |
| family_name        | string              | null: false                |
| first_name         | string              | null: false                |
| family_name_kana   | string              | null: false                |
| first_name_kana    | string              | null: false                |
| birthday           | date                | null: false                |

### Association

* has_many :seller_items, class_name: 'item', foreign_key: 'seller_id'
* has_many :buyer_items, class_name: 'item', foreign_key: 'buyer_id'
* has_one :sending_destinations, dependent: :destroy




## sending_destinations table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| destination_first_name       | string       | null: false                    |
| destination_family_name      | string       | null: false                    |
| destination_first_name_kana  | string       | null: false                    |
| destination_family_name_kana | string       | null: false                    |
| post_code                    | integer(7)   | null:false                     |
| prefecture_id                | integer      | null:false                     |
| city                         | string       | null:false                     |
| house_number                 | string       | null:false                     |
| building_name                | string       |
| phone_number                 | string       | unique: true                   |
| user                         | references   | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to_active_hash :prefecture





## items table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| name                         | string       | null: false                    |
| explanation                  | text         | null: false                    |
| category                     | references   | null: false, foreign_key: true |
| condition                    | references   | null: false,foreign_key: true  |
| price                        | integer      | null: false                    |
| brand                        | references   | foreign_key: true              |
| postage_id                   | integer      | null: false                    |
| prefecture_id                | integer      | null: false                    |
| size                         | references   | null: false, foreign_key: true |
| prepare_id                   | integer      | null: false, foreign_key: true |
| seller                       | references   | null: false, foreign_key: true |
| buyer                        | references   | foreign_key: true              |


### Association

* has_many :item_images, dependent: :destroy
* belongs_to_active_hash :prefecture
* belongs_to :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :postage
* belongs_to_active_hash :prepare
* belongs_to :seller, class_name: 'user', foreign_key: 'seller_id'
* belongs_to :buyer, class_name: 'user', foreign_key: 'buyer_id'




## purchases table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| item                         | references   | null: false, foreign_key:true  |
| user                         | references   | null: false, foreign_key:true  |


### Association

* belongs_to :item
* belongs_to :user



## images table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| image                        | string       | null:false                     |
| item                         | references   | null:false, foreign_key:true   |


### Association

* belongs_to :item