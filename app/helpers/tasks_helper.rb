module TasksHelper
  def default_tasks(moving)
    [
      ["現在の住まいの管理会社に引越・退去の連絡","必要な持ち物", "1か月前まで"],
      ["引越日時の確定","必要な持ち物", "1か月前まで"],
      ["インターネット回線の解約の手続き","必要な持ち物", "1か月前まで"],
      ["インターネット回線の申込の手続き","必要な持ち物", "1か月前まで"],

      ["電気会社への開通・開始連絡","必要な持ち物", "14日前まで"],
      ["ガス会社への開通・開始連絡","必要な持ち物", "14日前まで"],
      ["新居の物件契約・初期費用の支払い","必要な持ち物", "14日前まで"],
      ["退去立ち合い日時の確定 ※賃貸の方のみ","必要な持ち物", "14日前まで"],
      ["NHK/ケーブルテレビの移転連絡 ※契約者の方のみ","必要な持ち物", "14日前まで"],

      ["必要な梱包資材を手配","必要な持ち物", "10日前まで"],
      ["不用品・粗大ゴミの処分","必要な持ち物", "10日前まで"],

      ["不用品の仕分けや処分","必要な持ち物", "1週間前まで"],
      ["新居のレイアウトを決める","必要な持ち物", "1週間前まで"],
      ["新居で新たに使う家具を決める","必要な持ち物", "1週間前まで"],
      ["荷造りを始める","必要な持ち物", "1週間前まで"],
      ["定期配達サービスの契約変更・解約 ※利用者のみ","必要な持ち物", "1週間前まで"],
      ["郵便局への転送手続き","必要な持ち物", "1週間前まで"],
      ["電気会社への停止・解約連絡","必要な持ち物", "1週間前まで"],
      ["ガス会社への停止・解約連絡","必要な持ち物", "1週間前まで"],
      ["水道局への停止・解約連絡","必要な持ち物", "1週間前まで"],
      ["引越の挨拶の手土産の準備","必要な持ち物", "1週間前まで"],
      ["ゴミ出し","必要な持ち物", "1週間前まで"],
      ["印鑑登録の廃止手続き ※印鑑登録がない場合のみ","必要な持ち物", "1週間前まで"],
      ["インターネット回線の申込の手続き","必要な持ち物", "1週間前まで"],

      ["ストーブやファンヒーターの灯油抜き・灯油の廃棄処理","必要な持ち物", "前日まで"],
      ["インターネット等の返却","必要な持ち物", "前日まで"],
      ["洗濯機の水抜き","必要な持ち物", "前日まで"],
      ["当日持っていく貴重品類をまとめる","必要な持ち物", "前日まで"],
      ["旧居のお掃除","必要な持ち物", "前日まで"],
      ["引越し挨拶","必要な持ち物", "前日まで"],

      ["電力の停止立ち合い","必要な持ち物", "当日"],
      ["ガスの停止立ち合い","必要な持ち物", "当日"],
      ["水道の停止立ち合い","必要な持ち物", "当日"],
      ["新居の初期状態を記録を残す","必要な持ち物", "当日"],
      ["ガスの開栓立ち合い","必要な持ち物", "当日"],
      ["水道局への開栓・開始連絡","必要な持ち物", "当日"],

      ["鍵返却＆退去立ち合い（現住所明け渡し）","必要な持ち物", "1週間後まで"],
      ["運転免許証の住所変更｜※免許所持の方のみ","必要な持ち物", "1週間後まで"],

      ["マイナンバーカードの住所変更","必要な持ち物", "2週間後まで"],
      ["印鑑登録の住所変更・登録手続き｜※印鑑登録がある場合のみ","必要な持ち物", "2週間後まで"],
      ["銀行・保険・証券会社などの住所変更","必要な持ち物", "2週間後まで"],
      ["クレジットカードの住所変更手続き","必要な持ち物", "2週間後まで"],

      ["クレジットカードの住所変更手続き","必要な持ち物", "1か月後まで"],
  
    ].each do |title, content, deadline|
      Task.create(
        title: title,
        content: content,
        deadline: deadline,
        moving: moving,
      )
    end
  end
end


