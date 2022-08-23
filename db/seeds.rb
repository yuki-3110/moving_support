# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "test1", email: "test1@email.com", password: "111111", admin: true)
user2 = User.create(name: "test2", email: "test2@email.com", password: "222222")
user3 = User.create(name: "test3", email: "test3@email.com", password: "333333")
user4 = User.create(name: "test4", email: "test4@email.com", password: "444444")
user5 = User.create(name: "test5", email: "test5@email.com", password: "555555")
# Task.create([
#   {title: "現在の住まいの管理会社に引越・退去の連絡", content: "必要な持ち物", deadline: "1か月前まで"},
#   {title: "引越日時の確定", content: "必要な持ち物", deadline: "1か月前まで"},
#   {title: "インターネット回線の解約の手続き", content: "必要な持ち物", deadline: "1か月前まで"},
#   {title: "インターネット回線の申込の手続き", content: "必要な持ち物", deadline: "1か月前まで"},


#   {title: "電気会社への開通・開始連絡", content: "必要な持ち物", deadline: "14日前まで"},
#   {title: "ガス会社への開通・開始連絡", content: "必要な持ち物", deadline: "14日前まで"},
#   {title: "新居の物件契約・初期費用の支払い", content: "必要な持ち物", deadline: "14日前まで"},
#   {title: "退去立ち合い日時の確定 ※賃貸の方のみ", content: "必要な持ち物", deadline: "14日前まで"},
#   {title: "NHK/ケーブルテレビの移転連絡 ※契約者の方のみ", content: "必要な持ち物", deadline: "14日前まで"},


#   {title: "必要な梱包資材を手配", content: "必要な持ち物", deadline: "10日前まで"},
#   {title: "不用品・粗大ゴミの処分", content: "必要な持ち物", deadline: "10日前まで"},


#   {title: "不用品の仕分けや処分", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "新居のレイアウトを決める", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "新居で新たに使う家具を決める", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "荷造りを始める", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "定期配達サービスの契約変更・解約 ※利用者のみ", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "郵便局への転送手続き", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "電気会社への停止・解約連絡", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "ガス会社への停止・解約連絡", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "水道局への停止・解約連絡", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "引越の挨拶の手土産の準備", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "ゴミ出し", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "印鑑登録の廃止手続き ※印鑑登録がない場合のみ", content: "必要な持ち物", deadline: "1週間前まで"},
#   {title: "インターネット回線の申込の手続き", content: "必要な持ち物", deadline: "1週間前まで"},


#   {title: "ストーブやファンヒーターの灯油抜き・灯油の廃棄処理", content: "必要な持ち物", deadline: "前日まで"},
#   {title: "インターネット等の返却", content: "必要な持ち物", deadline: "前日まで"},
#   {title: "洗濯機の水抜き", content: "必要な持ち物", deadline: "前日まで"},
#   {title: "当日持っていく貴重品類をまとめる", content: "必要な持ち物", deadline: "前日まで"},
#   {title: "旧居のお掃除", content: "必要な持ち物", deadline: "前日まで"},
#   {title: "引越し挨拶", content: "必要な持ち物", deadline: "前日まで"},


#   {title: "電力の停止立ち合い", content: "必要な持ち物", deadline: "当日"},
#   {title: "ガスの停止立ち合い", content: "必要な持ち物", deadline: "当日"},
#   {title: "水道の停止立ち合い", content: "必要な持ち物", deadline: "当日"},
#   {title: "新居の初期状態を記録を残す", content: "必要な持ち物", deadline: "当日"},
#   {title: "ガスの開栓立ち合い", content: "必要な持ち物", deadline: "当日"},
#   {title: "水道局への開栓・開始連絡", content: "必要な持ち物", deadline: "当日"},


#   {title: "鍵返却＆退去立ち合い（現住所明け渡し）", content: "必要な持ち物", deadline: "1週間後まで"},
#   {title: "運転免許証の住所変更｜※免許所持の方のみ", content: "必要な持ち物", deadline: "1週間後まで"},


#   {title: "マイナンバーカードの住所変更", content: "必要な持ち物", deadline: "2週間後まで"},
#   {title: "印鑑登録の住所変更・登録手続き｜※印鑑登録がある場合のみ", content: "必要な持ち物", deadline: "2週間後まで"},
#   {title: "銀行・保険・証券会社などの住所変更", content: "必要な持ち物", deadline: "2週間後まで"},
#   {title: "クレジットカードの住所変更手続き", content: "必要な持ち物", deadline: "2週間後まで"},


#   {title: "パスポートの変更手続き｜※本籍・氏名を変更した方のみ", content: "必要な持ち物", deadline: "1か月後まで"},
# ])