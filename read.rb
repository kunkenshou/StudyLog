  puts "メモのタイトル一覧"
  #メモの保存ディレクトリを配列化
  file_dir = Dir.entries($dir_path)
  
  #不要な要素を取り除いて、配列を再生成
  file_dir = file_dir.drop(2)
  
  #メモの保存ディレクトリを標準出力
  file_dir.each do |entry| 
  puts entry
  end
  
  #メモのタイトルがディレクトリに存在するタイトルが入力されたら戻り値をtureを返してる繰り返しの処理を抜ける
  loop do
  #メモのタイトルを標準入力で受け取る
  file_name = Readline.readline("メモのタイトルを入力してください。＞ :")
  
  #file_nameを正規表現でマッチング、変数に真偽値を格納
  normalized_input = file_name.match?($pattern)
  
  #file_dirの配列から標準入力されたタイトルを比較、変数に真偽値を格納
  value_exists = file_dir.include?(file_name)

#関数処理、引数の型によって別て戻り値に真偽値を返す
def normalized(value_exists, normalized_input)
  if value_exists == true
    return true
  elsif normalized_input == false
    return false
  end
end


#関数の戻り値が変数に代入
normalized_input = normalized(value_exists, normalized_input)

  #真偽値で処理を分岐、tureなら標準入力で受け取ったタイトルのメモの内容を表示する、falseならメモを見るの処理に戻る
  if normalized_input == true
  file_path = File.join($dir_path, file_name)
  file = File.read(file_path)
  puts file
  else
    puts "ファイル名が存在しません。もう一度入力してください。"
  end
  
  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == true
  #メモを表示するのループ終了
end
