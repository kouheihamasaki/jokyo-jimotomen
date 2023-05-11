# 上京しても地元麺！

## サイト概要
東京および関東周辺の地元麺（ラーメン・うどん・そばなど）の投稿・それに対するレビューサイト

ex) 博多豚骨ラーメン・愛知味噌煮込みうどん・山形冷たい肉そばなど

### サイトテーマ
上京しても地元の麺が親代わり - 寂しい日でもこのサイトを見れば１人じゃない気がする

### テーマを選んだ理由
私がこのテーマを選んだ理由は、大きく5つです。
* 地元で毎日食べていた豚骨ラーメンが上京した際に恋しかった経験から、同じような境遇・思いの人がいると感じたため
* 東京の豚骨ラーメンについて調べることが難しいため簡単に調べることができるサイトがあればと感じたため
* 東京の人のレビューより、同じ地元の方のレビューのほうが味覚の方向性が近いため、境遇の近い人が集まるサイトがあればその人にとって理想の店情報が集まると感じたため
* 前職で仙台に転勤した際に食べた山形そばに感銘を受け、一般の人が「縁がなければ食べない」という状況がもったいないと感じたため
* 地元の麺類について語りたいが、近くに語る人がいないという経験から、そのような場所があればと感じたため

### ターゲットユーザ
* 地方から東京へ移動してきた方で、地元の麺類のお店を探している人
* 東京にいながらも地元の好物の麺類について語れる場所が欲しい人

### 主な利用シーン
* 地元でよく食べていた好物の麺類を東京および関東周辺で探す際に
* 好物の麺類について語りたい際に
* 新しい麺類に興味をもつきっかけに

## 設計書
- [Ul flows](https://drive.google.com/file/d/1hLhHS-7BSmVVqfgfaPFu_JrZS_Dzidrc/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1QuqncXvnUsldmLhmMuWngtCDzAqda2hqsmP3NMpP8K0/edit?usp=sharing)
- [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1J0atSE5oLlJpWNxAWzLpRH4UasSJi3fgvbVtSDLb4yw/edit?usp=sharing)
- [ER図](https://drive.google.com/file/d/1RI6oajmr6M0W6lo1gTIePwTfHq2wiYLi/view?usp=sharing)
- [インフラ設計書](https://docs.google.com/spreadsheets/d/1DBqheUBzC4yjx2xSUdaRcr6dLniOMT0DKzAd6mjWrM0/edit?usp=sharing)
- [AWS構成図](https://drive.google.com/file/d/1RAfNmBxTyI_PlC3GvegNGArrDEBbtCGN/view?usp=sharing)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby, SQL
- フレームワーク：Ruby on Rails, Rspec
- JSライブラリ：jQuery
- API：Google Maps API
- IDE：Cloud9


## 機能リスト
- マイページログイン
- マイページログアウト
- ゲストログイン
- 退会機能
- 投稿機能
- 投稿検索機能（タグ検索）
- 投稿検索機能（ワード検索）
- レビュー機能（Raty）
- マップ表示機能（Google maps API）
- コメント機能（非同期通信）
- いいね機能（非同期通信）
- 管理者ログイン機能、管理機能
- コミュニティ機能
- AWSにてインフラを構築（上記「設計書」内に記載）

