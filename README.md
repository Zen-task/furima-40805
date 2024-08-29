## 1. Users テーブル
ユーザー情報の管理

| Column              | Type     | Options                             |
|---------------------|----------|-------------------------------------|
| user_name           | string   | null: false                         |
| email               | string   | null: false, unique: true           |
| encrypted_password  | string   | null: false                         |
| last_name           | string   | null: false                         |
| first_name          | string   | null: false                         |
| last_name_kana      | string   | null: false                         | 
| first_name_kana     | string   | null: false                         |
| birth_date          | date     | null: false                         |

### Association
- has_many :items
- has_many :orders

---

## 2. Items テーブル
商品情報の管理

| Column                | Type       | Options                             |
|-----------------------|------------|-------------------------------------|
| name                  | string     | null: false                         |
| description           | text       | null: false                         |
| price                 | integer    | null: false                         |
| user                  | references | null: false, foreign_key: true      |
| category_id           | integer    | null: false                         |
| condition_id          | integer    | null: false                         |
| shipping_fee_id       | integer    | null: false                         |
| prefecture_id         | integer    | null: false                         |
| shipping_day_id       | integer    | null: false                         |

### Association
- belongs_to :user
- has_one :order

---

## 3. Orders テーブル
購入情報の管理

| Column     | Type       | Options                             |
|------------|------------|-------------------------------------|
| user       | references | null: false, foreign_key: true      |
| item       | references | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

---

## 4. Addresses テーブル
配送先住所情報の管理

| Column        | Type       | Options                             |
|---------------|------------|-------------------------------------|
| order         | references | null: false, foreign_key: true      |
| postal_code   | string     | null: false                         |
| prefecture_id | integer    | null: false                         |
| city          | string     | null: false                         |
| block         | string     | null: false                         |
| building      | string     |                                     |
| phone_number  | string     | null: false                         |

### Association
- belongs_to :order

---

## ER 図の概要
- **Users と Items**: 1対多の関係
- **Users と Orders**: 1対多の関係
- **Items と Orders**: 1対1の関係
- **Orders と Addresses**: 1対1の関係
