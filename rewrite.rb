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
puts normalized_input.class
#break if normalized_input == true

  #真偽値で処理を分岐、tureなら標準入力で受け取ったタイトルのメモの内容を表示する、falseならメモを見るの処理に戻る
  if normalized_input == false
  
  file_path = File.join($dir_path, $file_name)
  
  file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。＞ :")
  File.open(file_path, "r+") do |file|
  # ファイルの内容を読み取り
  content = File.read(file_path)
  # ファイルの内容を編集
  modified_content = content.gsub(file_path, file_content)

  # 編集した内容をファイルに書き込み
  file.rewind
  file.write(modified_content)
  end
  
  
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

