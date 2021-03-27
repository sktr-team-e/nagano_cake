# ながのCAKE

## 概要説明
　![Top](https://user-images.githubusercontent.com/76933785/112716905-7dfd0900-8f2c-11eb-97fa-01d895191add.PNG)
  
   長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト

## 使用言語・環境
 - Ruby
 - HTML&CSS
 - フレームワーク
   - Ruby on Rails (バージョン 5.2.4)

### Gem
- devise : admin/customer ユーザー登録・ログイン関係
- refile : 画像アップロード
- refile-mini_magick : 画像投稿用
- bootstrap : レイアウト用
- kaminari : ページング機能
- simple_form : フォーム機能

## 実装機能
- Topページ
- Aboutページ
### Customer
- 会員登録・編集・退会機能
- 配送先登録機能
- 商品一覧・詳細機能
- カート機能
- 注文機能
### Admin
- 管理者ログイン機能
- 商品一覧・詳細・新規登録機能
- 会員一覧・詳細・退会編集機能
- 注文履歴一覧・詳細機能
- ステータス（注文・製造）変更機能
- カテゴリー追加機能

## ER図
![ER図（Eチーム）](https://user-images.githubusercontent.com/76933785/112717638-62e0c800-8f31-11eb-838d-8e94f203914d.png)

## アプリケーション詳細設計書
![image](https://user-images.githubusercontent.com/76933785/112717582-1dbc9600-8f31-11eb-8370-60353a18c6a6.png)

![image](https://user-images.githubusercontent.com/76933785/112717596-35941a00-8f31-11eb-8f3e-0742d2caec22.png)

## 使用上注意
- $ bundle install
- $ rails db:migrate
- $ rails db:seed
 
### 管理者ログインテストアカウント
- email : admin@test.com
- pass : admins2021

## 開発者
### チーム名
* 鹿肉の唐揚げたらこラーメン
### メンバー
* なおき
* みやじ
* かいつん
* 食ぱんだ
