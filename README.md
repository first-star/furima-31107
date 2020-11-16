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

* has_many :seller_items, class_name: 'item', foreign_key: 'seller_id'
* has_many :buyer_items, class_name: 'item', foreign_key: 'buyer_id'
* has_one :purchases, dependent: :destroy




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





## items table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| name                         | string       | null: false                    |
| explanation                  | text         | null: false                    |
| category_id                  | integer      | null: false, foreign_key: true |
| condition_id                 | integer      | null: false,foreign_key: true  |
| price                        | integer      | null: false                    |
| brand                        | references   | foreign_key: true              |
| postage_id                   | integer      | null: false                    |
| prefecture_id                | integer      | null: false                    |
| size                         | references   | null: false, foreign_key: true |
| prepare_id                   | integer      | null: false, foreign_key: true |
| seller                       | references   | null: false, foreign_key: true |
| buyer                        | references   | foreign_key: true              |


### Association

* belongs_to_active_hash :prefecture
* belongs_to :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :postage
* belongs_to_active_hash :prepare
* belongs_to :seller, class_name: 'user', foreign_key: 'seller_id'
* belongs_to :buyer, class_name: 'user', foreign_key: 'buyer_id'
* belongs_to :purchases,





## purchases table

| Column                       | Type         | Options                        |
|------------------------------|--------------|--------------------------------|
| item                         | references   | null: false, foreign_key:true  |
| user                         | references   | null: false, foreign_key:true  |


### Association

* belongs_to :item
* belongs_to :user
* belongs_to :sending_destination


