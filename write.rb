#入力で受け取った値を評価して結果がtureになるまで処理を繰り返す
loop do

    #メモの保存ディレクトリを配列化
    file_dir = Dir.entries($dir_path)
  
    #dropメソッドで不要な要素を取り除いて配列を生成
    file_dir = file_dir.drop(2)

#入力で値を受け取る
  file_name = Readline.readline("メモのタイトルを入力してください。＞ :")

  #file_nameを正規表現でマッチング、変数に真偽値を格納
  normalized_input = file_name.match?($pattern)

  file_name = file_name + ".txt"

  #file_dirの配列から標準入力されたタイトルを比較、変数に真偽値を格納
 value_exists = file_dir.include?(file_name)

#関数処理、引数の型によって別て戻り値に真偽値を返す
def normalized(value_exists, normalized_input)
  case
  when value_exists == true || normalized_input == true
    return true
  when value_exists == false || normalized_input == true
    return false
  when value_exists == false || normalized_input == false
    return false
  end
end

  #関数の戻り値が変数に代入
  normalized_input = normalized(value_exists, normalized_input)

  #真偽値で処理を分岐、tureなら標準入力で受け取ったタイトルのメモの内容を表示する、falseならメモを見るの処理に戻る
  if normalized_input == false
  file_path = File.join($dir_path, file_name)
  file_create = File.new(file_path, "w")
  puts "メモを書いて下さい。"
  file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。＞ :")
  File.open(file_path, "w", 0755) do |file| file.write(file_content)
  end
else
  puts "タイトル #{file_name} は使用できません。他のタイトルを入力してください。"
end

  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == false
#繰り返しの処理終了
end
