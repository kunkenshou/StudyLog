require "readline"
require "./normalized.rb"

#path、配列の共通で利用しているコードを別ファイルに切り出し
load "./path.rb"


#例外処理
#begin

#ループ文開始
loop do 

#メニュー
menu_obj = MenuClass.new
puts menu_obj.menu


#string型で標準入力
$input = Readline.readline("指示を「 1 」か「 2 」か「3」か「 4 」で入力してください:").to_s

#標準入力値の文字数をカウント
$input_length = $input.length

#入力値チェックの関数をNormalizedClassへ移動
#NormalizedClassインスタンスを生成、normalized_objへ代入
normalized_obj = NormalizedClass.new
#normalized_objオブジェクトのnormalizedメソッドの返り値を変数へ代入
menu_number = normalized_obj.normalized($input, $pattern, $input_length, $menu_array)

puts "入力したのは: #{$input} です。"

case 
when menu_number == true
puts "#{$input} はメニューにありません。入力しなおしてください"
end

#プログラムを終了を処理
  answer = Readline.readline("本当に終了しますか(y/n) :") if menu_number == "4" 
  break if answer == 'y'

#メニューを分岐させる処理
case
#メモを作成する処理
when menu_number == "1"

  load "./write.rb"

#メモを削除する処理
when menu_number == "2"
  
  load "./delete.rb"

#メモの内容を表示する処理
when menu_number == "3"

  load "./read.rb"

when answer == "n"
  #プログラム終了をキャンセルする
  puts "メニューに戻ります"
end
#end

# readlineメソッドの例外処理
#rescue Errno::ENOENT
#puts "例外が発生しました。"

#ループ文終了
end


#例外の終了
#end


