# アプリケーション名
Shoefit-Pro

# アプリケーション概要
計測結果を表に入れるだけで瞬時に計算できる、プロのための足計測アプリケーション。

# URL
https://shoefit-pro.onrender.com/

# 利用方法
## 新規登録・ログイン
1.トップページ（一覧ページ）のヘッダー、またはメインに設置された新規登録ボタンからユーザー新規登録を行う。
2.新規登録済みユーザーは、トップページのヘッダーよりログインする。
## 足計測結果を計算する
1.ログイン後の一覧ページの表に計測値を記入する。
2.「理想の靴サイズの目安を出す」ボタンをクリックする。
3.計測結果が表示される。

# アプリケーションを作成した背景
このオリジナルアプリは足靴業界・医療介護業界向け（特に靴屋、シューフィッター、医療介護従事者など）の業務改善アプリです。
これまで足計測において以下の問題点がありました。
・足の計測結果を表を見ながらワイズ（足の幅）を出して理想靴サイズをださなければならず時間がかかるため。（計測〜結果提示までに15分はかかる）
・何度も表を見返し記録する作業の工程が多く、理想靴サイズに人為的なミスが生じることがあるため。
このアプリを使うことで「理想靴サイズを計測結果から導きだしお客様に提示するまでに時間がかかることや、そのため人為的なミスが生じること。」を解決することができます。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1g6c91cKC-yuT3T08tLyVx_Nz26vc20vSolj9wyK9Aik/edit#gid=0

# 実装した機能いついての画像やGIFおよびその説明
トップページから新規登録・ログインができます。
[![Image from Gyazo](https://i.gyazo.com/d0dda7163c7c37f5bd4483daacc2e66c.gif)](https://gyazo.com/d0dda7163c7c37f5bd4483daacc2e66c)
登録画面に不備があった際はエラーメッセージが表示されます。
[![Image from Gyazo](https://i.gyazo.com/284dd92d54a32859a1cc64fb9db8cdeb.gif)](https://gyazo.com/284dd92d54a32859a1cc64fb9db8cdeb)
新規登録後、ユーザー専用ページにて理想靴サイズの目安の計算が可能です。
[![Image from Gyazo](https://i.gyazo.com/85ca91d7f7d570a4fbc14c2d3c6f31cd.gif)](https://gyazo.com/85ca91d7f7d570a4fbc14c2d3c6f31cd)
ユーザー管理ページでは会員情報の編集や削除が可能です。
[![Image from Gyazo](https://i.gyazo.com/62955e5e0b6f8d897ec331445670fc74.gif)](https://gyazo.com/62955e5e0b6f8d897ec331445670fc74)
ログアウトボタンをクリックするとログアウトしトップページに遷移します。
[![Image from Gyazo](https://i.gyazo.com/614be9df9de948043f53bdf8037ed85f.gif)](https://gyazo.com/614be9df9de948043f53bdf8037ed85f)
計測結果を表に記載しボタンを押すと、理想の足サイズの計算結果が表示されます。
[![Image from Gyazo](https://i.gyazo.com/82a2a234add65dffb2e521c0fe1d83f8.gif)](https://gyazo.com/82a2a234add65dffb2e521c0fe1d83f8)

# 実装予定の機能
現在、理想の靴サイズの目安の計算機能の詳細を実装中。
今後は計算結果をお客様毎に保存する機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/e2819214428ebb6c276c9fbafe3b42fc.png)](https://gyazo.com/e2819214428ebb6c276c9fbafe3b42fc)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/87f5e75b7e4cfa9f4a582d7b289aa5a4.png)](https://gyazo.com/87f5e75b7e4cfa9f4a582d7b289aa5a4)

# 開発環境
・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/coffta/shoefit-pro
% cd shoefit-pro
% bundle install
% yarn install

# 工夫したポイント
①お客様、患者様に理想靴サイズを迅速に提示できる。
②理想靴サイズを間違うミスを防ぐことができる。
③荷重計測、非荷重計測の両方を含む理想靴サイズの提示アプリケーション自体がまず存在しない。

〜その他〜
・迅速で的確な理想靴サイズの提示を行えることで販売者・治療者に対するお客様や患者様からの信頼度を上げる事ができる。
・理想靴サイズの提示にかかる時間を、お客様、患者様とのコミュニケーションの時間にできるためサービスの販売促進に繋がる。

以上の点でシンプルでユーザーに使いやすいような実装を心がけて開発しました。
