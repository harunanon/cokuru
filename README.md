# アプリケーション名
cokuru

# アプリケーション概要
コワーキングスペースを席のタイプごとに日時指定していつでも予約・決済できる。

# URL
https://cokuru.onrender.com/<br>
・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>

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
has_many :reservations<br>
has_many :coworking_spaces, through: :reservations


# Reservationsテーブル
| Column             | Type     | Options                          |
| ------------------ | -------- | -------------------------------- |
| seat_type_id       | integr   | null:false,                      |
| user               | refernces| null:false,foreign_key:true      |
| day                | date     | null:false                       |
| time               | datetime | null:false                       |
| start_time         | datetime | null:false                       |
| created_at         | datetime | null:false                       |
| updated_at         | datetime | null:false                       |

### Association
belongs_to :user<br>
belongs_to :coworking_space

# ER図
![alt text](ER図.jpg)

# 開発環境
・フロントエンド：HTML/CSS 、Javascripts<br>
・バックエンド：Ruby, Ruby on Rails 7.0<br>
・インフラ：Render<br>
・テキストエディタ：VSCode<br>

# ローカルでの動作方法
% git clone https://github.com/harunanon/cokuru<br>
% cd ~/projects/<br>
% cd cokuru<br>

# 制作時間
100時間