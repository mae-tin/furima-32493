#　テーブル設計

## usersテーブル
| Column          | Type   | Options      |
| --------------- | ------ | ------------ |
| email           | string | null: false  |
| password        | string | null: false  |
| nickname        | string | null: false  |
| last_name       | string | null: false  |
| first_name      | string | null: false  |
| last_name_kana  | string | null: false  |
| first_name_kana | string | null: false  |
| birthday        | date   | null: false  |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| item_name    | string     |  null: false                    |
| text         | text       |  null: false                    |
| category     | string     |  null: false                    |
| condition    | string     |  null: false                    |
| delivery_fee | integer    |  null: false                    |
| area         | string     |  null: false                    |
| days         | integer    |  null: false                    |
| price        | integer    |  null: false                    |
| user         | references |  null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

## ordersテーブル
| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| postcode     | string     |  null: false                    |
| prefecture   | string     |  null: false                    |
| city         | string     |  null: false                    |
| block        | string     |  null: false                    |
| building     | string     |  null: false                    |
| phone_number | string     |  null: false                    |
| user         | references |  null: false, foreign_key: true |
| item         | references |  null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order