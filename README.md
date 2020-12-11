# アプリケーション名
簡単レシピ

# アプリケーション説明
いろいろなレシピを閲覧し探したいレシピを検索、お気に入りにしたり、また自分のレシピを投稿・編集・削除ができるアプリケーションです。

# 本番環境
https://recipe-app31090.herokuapp.com/

basic認証 
  ユーザー admin 
  パスワード 2222

# 制作背景

https://docs.google.com/spreadsheets/d/1-PIIWCsXr-FctRb8_WmyRW3MQGfRz6ynpJoQrFLWkrA/edit#gid=282075926

# DEMO

## トップページ
![](https://github.com/Egami-yuk/recipe-app/blob/master/readme.img/recipe-toppage.png)

トップページに新着レシピ一覧とお気に入り数に応じたランキングを表示
またトップページからキーワード検索、カテゴリー検索や各ページへ遷移することができる。

## レシピ作成
![](https://github.com/Egami-yuk/recipe-app/blob/master/readme.img/recipe-newpage.png)

レシピ作成する際に投稿する画像プレビュー機能実装しました。

## レシピ詳細
![](https://github.com/Egami-yuk/recipe-app/blob/master/readme.img/recipe-show.png)

レシピの詳細に非同期通信でのお気に入り機能を実装しました、

## ユーザーページ
![](https://github.com/Egami-yuk/recipe-app/blob/master/readme.img/user-page.png)

マイページでは自分が投稿したレシピやお気に入りのレシピを表示しています。

![](https://github.com/Egami-yuk/recipe-app/blob/master/readme.img/user-show.png)

自分以外のユーザーページではそのユーザーが投稿したレシピを表示しています。

# 実装予定の機能
## レシピに対するコメント機能
## お気に入りのユーザーをフォローできる機能



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
