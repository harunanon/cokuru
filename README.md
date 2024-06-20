# Usersテーブル　（ユーザー管理機能）
| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| id                 | bigint   | null:false,primary key   |
| name               | string   | null:false               |
| email              | string   | null:false, unique: true |
| password           | string   | null:false               |
| created_at         | datetime | null:false               |
| updated_at         | datetime | null:false               |

### Association
has_many :reservations
has_many :coworking_spaces, through: :reservations


# Reservationsテーブル
| Column             | Type     | Options                          |
| ------------------ | -------- | -------------------------------- |
| id                 | bigint   | null:false,primary key           |
| user_id            | int      | null:false,foreign_key:true      |
| coworking_space_id | int      | null:false,foreign_key:true      |
| start_time         | datetime | null:false                       |
| end_time           | datetime | null:false                       |
| created_at         | datetime | null:false                       |
| updated_at         | datetime | null:false                       |
| user_name          | string   | null:false                       |

### Association
belongs_to :user
belongs_to :coworking_space