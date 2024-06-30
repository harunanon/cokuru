# アプリケーション名
cokuru

# アプリケーション概要
コワーキングスペースを席のタイプごとに日時指定していつでも予約・決済できる。

# URL
https://cokuru.onrender.com/<br>

# テスト用アカウント
・Basic認証パスワード：2222<br>
・Basic認証ID：admin<br>
・メールアドレス：test2@test.mail	<br>
・パスワード：a11111<br>

# 利用方法
1.トップページの左上にある白の「新規登録」ボタンからユーザー新規登録を行う。<br>
2.新規登録したら、下の方法で予約する。<br>
①トップページのカレンダーの予約したい日が空席「◯」の場合、「◯」を選択すると新規予約ページに遷移する。<br>
②新規予約画面のプルダウンから、「席のタイプ」を選択して「予約する」ボタンを押すと購入画面に遷移する。 （クレジット決済機能※は実装中）<br>
③カレンダーの予約日に予約した「席のタイプ」名が表示されて、予約完了 （※クレジット決済機能：「購入」ボタンを押したら決済画面に遷移し、オンラインクレジット決済できる様に現在、実装中）<br>


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

# Coworkingspacesテーブル
| Column             | Type     | Options                          |
| ------------------ | -------- | -------------------------------- |
| id                 | int      |null: false, primary key          |
| name               | string   | null:false                       |
| description        | text     | null:false                       |
| location           | string   | null:false                       |
| price              | integer  | null:false                       |
| created_at         | datetime | null:false                       |
| updated_at         | datetime | null:false                       |

# Paymentsテーブル
| Column             | Type     | Options                          |
| ------------------ | -------- | -------------------------------- |
| id                 | int      | null: false, primary key         |
| reservation_id     | bigint   | null: false, foreign_key: true   |
| amount             | integer  | null: false                      |
| method             | string   | null: false                      |
| payment_date       | datetime | null: false                      |
| status             | string   | null: false                      |
| created_at         | datetime | null: false                      |
| updated_at         | datetime | null: false                      |


# ER図
![alt text](ER図２.jpg)

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