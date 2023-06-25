#メモを変更する処理

require "./normalized.rb"
require "./path.rb"

#メモの保存ディレクトリ配列、Array型が格納
dir_obj = DirClass.new
#NormalizedClassクラスからインスタンスを作成、normalizedオブジェクトを作成
normalized_obj = NormalizedClass.new
#normalized_obj2 = NormalizedClass2.new


$filename = "メモを変更します。"
puts "#{$filename}"

#入力で受け取った値を評価して結果がtureになるまで処理を繰り返す
loop do

  #メモの保存ディレクトリを出力
dir_obj = DirClass.new 
puts file_dir = dir_obj.filedir($dir_path)


#入力で値を受け取る
  $file_name = Readline.readline("変更したいメモのタイトルを入力してください。＞ :")

 
 #関数の戻り値を変数に代入
normalized_input = normalized_obj.title_normalized($value_exists, $normalized_input)
#break if normalized_input == true

  #真偽値で処理を分岐、tureなら標準入力で受け取ったタイトルのメモの内容を表示する、falseならメモを見るの処理に戻る
  if normalized_input == false
  
  file_path = File.join($dir_path, $file_name)

#メモのファイルを開いてオブジェクトを生成、戻り値はFile型
memo_file = File.new(file_path)

#Fileの識別子からファイルの内容を読み込み、戻り値はString型
memo_file = memo_file.read

puts "メモの内容#{memo_file}"

#置き換え前の内容を入力
txt_old = Readline.readline("置き換える内容を入力してください。＞ ：")

#置き換え後の内容を入力
txt_new = Readline.readline("新しい内容を入力してください。＞ :")


#文字列のパターンにマッチした部分を置き換えて文字列を生成、戻り値はString型
memo_file = memo_file.gsub(txt_old, txt_new)

#ファイルを書き込みモードで開いて、memo_file変数の文字列をファイルに書き込んでファイルを閉じる。
File.open(file_path, "w+") do |file| 
file.write(memo_file)
end

#Fileの識別子からファイルの内容を読み込み、戻り値はString型
memo_file = File.read(file_path)

puts "#{txt_old}を#{txt_new}へ置き換えました。"

=begin
f2 = File.new(file_path, "r")
r2 = f2.read
puts r2.class
puts r2
f.close
=end

=begin
20230625に作成した処理
  open(file_path) do |file| 
    data = file.read
    puts data
  end

txt_old  = Readline.readline("変更したい所を入力＞ :").to_s
txt_new = Readline.readline("変更する内容を入力＞ :").to_s


  #ファイルを開く
  # f = File.new(file_path) 
  File.open(file_path) do |f|
    contents = f.read
    con = contents.gsub(txt_old, txt_new)
    puts "#{txt_old}を#{txt_new}へ変更しました"

    puts con.class

    open(file_path, "w", 0755) do |f| f.write(con)
    
    test = f.read(file_path)
    end
end
=end

=begin
  f = File.open(file_path, "r")
  content = f.read(file_path)
  puts content
  f.close
=end

  #file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。＞ :")
  #File.open(file_path, "w", 0755) do |file| file.write(file_content)
  #end
  else
    puts "タイトル #{$file_name} は使用できません。他のタイトルを入力してください。"
  end
  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == false
#繰り返しの処理終了
end

