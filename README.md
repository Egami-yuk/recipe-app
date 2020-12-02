# アプリケーション名
簡単レシピ

# アプリケーション概要
ユーザー登録・ログイン・ログアウト・レシピ投稿・編集・削除・検索・他ユーザーのレシピをお気に入り

# URL
https://recipe-app31090.herokuapp.com/

# テスト用アカウント
basic認証 ユーザー admin パスワード 2222
テストアカウント email a@aaa.com password aaaaaa1

# 利用方法
いろいろなレシピを閲覧し探したいレシピを検索したりお気に入りにしたり、また自分のレシピを投稿・編集・削除ができるアプリケーションです

# 目指した課題解決
この簡単レシピを通して普段料理をしない人が作れる

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1-PIIWCsXr-FctRb8_WmyRW3MQGfRz6ynpJoQrFLWkrA/edit#gid=282075926

# 実装予定の機能

# ローカルでの動作方法


# README

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_many :recipes
- has_many :favorites

## recipes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| info        | text       | null: false                    |
| category_id | integer    | null: false                    |
| serving_id  | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_one :ingredient
- has_one :recipe-step

## ingredients テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| ingredient1  | string | null: false |
| ingredient2  | string | null: false |
| ingredient3  | string | null: false |
| ingredient4  | string | null: false |
| ingredient5  | string | null: false |
| ingredient6  | string | null: false |
| ingredient7  | string | null: false |
| ingredient8  | string | null: false |
| ingredient9  | string | null: false |
| ingredient10 | string | null: false |
| ingredient11 | string | null: false |
| ingredient12 | string | null: false |
| ingredient13 | string | null: false |
| ingredient14 | string | null: false |
| ingredient15 | string | null: false |
| ingredient16 | string | null: false |
| ingredient17 | string | null: false |
| ingredient18 | string | null: false |
| ingredient19 | string | null: false |
| ingredient20 | string | null: false |

### Association

- belongs_to :recipe

## recipe-steps テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| step1  | string | null: false |
| step2  | string | null: false |
| step3  | string | null: false |
| step4  | string | null: false |
| step5  | string | null: false |
| step6  | string | null: false |
| step7  | string | null: false |
| step8  | string | null: false |
| step9  | string | null: false |
| step10 | string | null: false |

### Association

- belongs_to :recipe

## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| recipe   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe