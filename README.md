# README

## usersテーブル

|Column              |Type       |Options                    |
|--------------------|-----------|---------------------------|
|nick_name           |string     |null: false                |
|full_name           |string     |null: false                |
|email               |string     |null: false, unique: true  |
|encrypted_password  |string     |null: false                |
|date_of_birth       |integer    |null: false                |

### Association
has_many :items
has_many :orders

## itemsテーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|name                |string     |null: false                    |
|categories          |string     |null: false                    |
|condition           |string     |null: false                    |
|price               |integer    |null: false                    |
|content             |text       |null: false                    |
|user                |references |null: false, foreign_key: true |
|shipping_type       |string     |null: false                    |
|shipping_from       |string     |null: false                    |
|shipping_days       |string     |null: false                    |

### Association
belongs_to :user
has_one :order

## ordersテーブル

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|user                |references |null: false,foreign_key:true    |
|item                |references |null: false,foreign_key:true    |

### Association
belongs_to :item
belongs_to :user
has_one :address

## addressesテーブル

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|order               |references |null: false,foreign_key:true   |
|telephone_number    |integer    |null: false                    |
|post_code           |integer    |null: false                    |
|prefecture          |string     |null: false                    |
|city                |string     |null: false                    |
|user                |references |null: false,                   |
|address             |integer    |null: false                    |
|building_name       |string     |                               |

### Association
belongs_to :order

