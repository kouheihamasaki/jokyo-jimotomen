# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!(name: "北海道", tag_kind: "prefecture")
Tag.create!(name: "青森県", tag_kind: "prefecture")
Tag.create!(name: "岩手県", tag_kind: "prefecture")
Tag.create!(name: "宮城県", tag_kind: "prefecture")
Tag.create!(name: "秋田県", tag_kind: "prefecture")
Tag.create!(name: "山形県", tag_kind: "prefecture")
Tag.create!(name: "福島県", tag_kind: "prefecture")
Tag.create!(name: "茨城県", tag_kind: "prefecture")
Tag.create!(name: "栃木県", tag_kind: "prefecture")
Tag.create!(name: "群馬県", tag_kind: "prefecture")
Tag.create!(name: "埼玉県", tag_kind: "prefecture")
Tag.create!(name: "千葉県", tag_kind: "prefecture")
Tag.create!(name: "東京都", tag_kind: "prefecture")
Tag.create!(name: "神奈川県", tag_kind: "prefecture")
Tag.create!(name: "新潟県", tag_kind: "prefecture")
Tag.create!(name: "富山県", tag_kind: "prefecture")
Tag.create!(name: "石川県", tag_kind: "prefecture")
Tag.create!(name: "福井県", tag_kind: "prefecture")
Tag.create!(name: "山梨県", tag_kind: "prefecture")
Tag.create!(name: "長野県", tag_kind: "prefecture")
Tag.create!(name: "岐阜県", tag_kind: "prefecture")
Tag.create!(name: "静岡県", tag_kind: "prefecture")
Tag.create!(name: "愛知県", tag_kind: "prefecture")
Tag.create!(name: "三重県", tag_kind: "prefecture")
Tag.create!(name: "滋賀県", tag_kind: "prefecture")
Tag.create!(name: "京都府", tag_kind: "prefecture")
Tag.create!(name: "大阪府", tag_kind: "prefecture")
Tag.create!(name: "兵庫県", tag_kind: "prefecture")
Tag.create!(name: "奈良県", tag_kind: "prefecture")
Tag.create!(name: "和歌山県", tag_kind: "prefecture")
Tag.create!(name: "鳥取県", tag_kind: "prefecture")
Tag.create!(name: "島根県", tag_kind: "prefecture")
Tag.create!(name: "岡山県", tag_kind: "prefecture")
Tag.create!(name: "広島県", tag_kind: "prefecture")
Tag.create!(name: "山口県", tag_kind: "prefecture")
Tag.create!(name: "徳島県", tag_kind: "prefecture")
Tag.create!(name: "香川県", tag_kind: "prefecture")
Tag.create!(name: "愛媛県", tag_kind: "prefecture")
Tag.create!(name: "高知県", tag_kind: "prefecture")
Tag.create!(name: "福岡県", tag_kind: "prefecture")
Tag.create!(name: "佐賀県", tag_kind: "prefecture")
Tag.create!(name: "長崎県", tag_kind: "prefecture")
Tag.create!(name: "熊本県", tag_kind: "prefecture")
Tag.create!(name: "大分県", tag_kind: "prefecture")
Tag.create!(name: "宮崎県", tag_kind: "prefecture")
Tag.create!(name: "鹿児島県", tag_kind: "prefecture")
Tag.create!(name: "沖縄県", tag_kind: "prefecture")

Tag.create!(name: "醤油ラーメン", tag_kind: "genre")
Tag.create!(name: "味噌ラーメン", tag_kind: "genre")
Tag.create!(name: "豚骨ラーメン", tag_kind: "genre")
Tag.create!(name: "塩ラーメン", tag_kind: "genre")
Tag.create!(name: "鶏白湯ラーメン", tag_kind: "genre")
Tag.create!(name: "煮干しラーメン", tag_kind: "genre")
Tag.create!(name: "家系ラーメン", tag_kind: "genre")
Tag.create!(name: "二郎系ラーメン", tag_kind: "genre")
Tag.create!(name: "担々麺", tag_kind: "genre")
Tag.create!(name: "タンメン", tag_kind: "genre")
Tag.create!(name: "ちゃんぽん", tag_kind: "genre")
Tag.create!(name: "うどん", tag_kind: "genre")
Tag.create!(name: "そば", tag_kind: "genre")
Tag.create!(name: "油そば", tag_kind: "genre")
Tag.create!(name: "つけ麺", tag_kind: "genre")

Tag.create!(name: "あっさり", tag_kind: "others_tag")
Tag.create!(name: "こってり", tag_kind: "others_tag")





Admin.create!(
    email: 'jokyo_jimotomen_adomin@gmail.com',
    password: 'jokyojimotomen',
)
