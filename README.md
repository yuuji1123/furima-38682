## users

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false,unique: true |
| encrypted_password | string     | null: false              |
| family_name        | string     | null: false              |
| first_name         | string     | null: false              |
| family_name_kana   | string     | null: false              |
| first_name_kana    | string     | null: false              |
| birthday           | date       | null: false              |

### Association
has_many :items
has_many :records

## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| ship_address       | string     | null: false                    |
| shipping_day       | string     | null: false                    |
| price              | bigint     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :record

## records
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |
| address_id         | references | null: false, foreign_key: true |

### Association
belongs_to :address
has_one :user
has_one :address

## addresses
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | integer    | null: false                    |
| region             | text       | null: false                    |
| city               | text       | null: false                    |
| block              | text       | null: false                    |
| building           | text       |                                |
| phone_number       | integer    | null: false                    |
| record_id          | references | null: false, foreign_key: true |

### Association
has_one :record