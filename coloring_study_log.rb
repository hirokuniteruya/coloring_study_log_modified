# 2020-08-23 13:00
# rubyハッカソン（コーディング時間：1h）
# 題材：塗り絵勉強法
# 概要：入力した学習項目と時間をもとに学習記録を表示するプログラム。
# 　　　学習時間15分につき1マス分表示する。
# 　　　既存の学習項目が入力された場合、当該項目の学習時間に加算する。
# 　　　新しい学習項目が入力された場合、それを追加する。
# 実行例）
# 　　今日はどの項目を何分勉強した？
# 　　学習項目を入力 > Ruby
# 　　学習時間を入力 > 30
# 　出力結果：
# 　　Ruby ■ ■　　←15分ごとに１マス増える
######
# 以下、私のコード。
# このプログラムでは、study_logsというハッシュの
# キーに勉強科目、バリューに学習時間の累計を保持します。
# 下記のような感じ。
# study_logs = {
#   ruby: 15,
#   rails: 45,
#   hoge: 25,
# }
# 入力情報をもとに、update_logsメソッドでstudy_logsの更新を行い、
# 更新後のstudy_logsを用いてprint_logsメソッドで学習記録をコンソールに出力。


# 入力された学習項目・時間をもとに、学習記録を保持するハッシュstudy_logsを更新するメソッド
def update_logs(input_subject, input_minutes,study_logs)
  input_subject.downcase!
  if study_logs.has_key?(input_subject)
    study_logs[input_subject] += input_minutes
  else
    study_logs[input_subject] = input_minutes
  end
end

# 学習記録を保持するハッシュstudy_logsをもとに、学習記録を標準出力へ表示するメソッド。
def print_logs(study_logs)
  puts "＊＊＊＊学習記録＊＊＊＊"
  study_logs.each{|subject,minutes|
    coloring_blocks = ""
    (minutes/15).times {
      coloring_blocks << "■"
    }

    puts "#{subject} #{coloring_blocks}"
  }
  puts "＊＊＊＊＊＊＊＊＊＊＊＊"
end

# メイン処理。
def main_proc
  study_logs = {}
  while true do
    # 変数の初期化
    input_subject = nil
    input_minutes = nil

    puts "※ 入力を終了する場合はexitと入力してください。"
    puts "学習項目を入力："
    input_subject = gets.chomp
    return if input_subject=="exit" # exitが入力されればループを終了。
    puts "学習時間を入力（単位：分）："
    input_minutes = gets.to_i

    update_logs(input_subject,input_minutes,study_logs)
    print_logs(study_logs)

  end
end

main_proc
