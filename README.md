# README

## usersテーブル

|Column              |Type       |Options                    |
|--------------------|-----------|---------------------------|
|nick_name           |string     |null: false                |
|last_name           |string     |null: false                |
|first_name          |string     |null: false                |
|last_name_kana      |string     |null: false                |
|first_name_kana     |string     |null: false                |
|email               |string     |null: false, unique: true  |
|encrypted_password  |string     |null: false                |
|birth_date          |date       |null: false                |

### Association
has_many :items
has_many :orders

## itemsテーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|name                |string     |null: false                    |
|category_id         |integer    |null: false                    |
|condition_id        |integer    |null: false                    |
|price               |integer    |null: false                    |
|content             |text       |null: false                    |
|user                |references |null: false, foreign_key: true |
|shipping_type_id    |integer    |null: false                    |
|shipping_day_id     |integer    |null: false                    |
|prefecture_id       |integer    |null: false                    |


### Association
belongs_to :user
has_one :order

## ordersテーブル

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|item                |references |null: false,foreign_key:true    |
|user                |references |null: false,foreign_key:true    |

### Association
belongs_to :item
belongs_to :user
has_one :address

## addressesテーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|order               |references |null: false,foreign_key:true   |
|telephone_number    |string     |null: false                    |
|post_code           |string     |null: false                    |
|prefecture_id       |integer    |null: false                    |
|city                |string     |null: false                    |
|address             |string     |null: false                    |
|building_name       |string     |                               |

### Association
belongs_to :order

