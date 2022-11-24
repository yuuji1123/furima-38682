## users

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| nickname           | string     | null: false  |
| email              | string     | null: false  |
| encrypted_password | string     | null: false  |
| family_name        | string     | null: false  |
| first_name         | string     | null: false  |
| family_name_kana   | string     | null: false  |
| first_name_kana    | string     | null: false  |
| birthday           | date       | null: false  |

### Association
has_many :items
has_many :records