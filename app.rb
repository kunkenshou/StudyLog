require "readline"

#ループ文開始
#例外処理
#begin
loop do 


#メニュー
puts "■ ■ ■ ■ ■ StudyLogのメニュー ■ ■ ■ ■ ■"
puts "・【メモを作る】は「 1 」を入力してください"
puts "・【メモを削除する】は「 2 」を入力してください"
puts "・【メモを見る】は「 3 」を入力してください"
puts "・【※ プログラムを終了する】は「 4 」を入力してください。"

#標準入力で受け取った値に例外が発生させない様にに正規表現でを変数に代入
pattern = /[%.+\/\p{Space}]/

#string型で標準入力
input = Readline.readline("指示を「 1 」か「 2 」か「3」か「 4 」で入力してください:").to_s

#標準入力値にpattern変数にある値と一致したらtrue、それ以外は入力値をstringで戻り値が返ってくる
def normalized(input, pattern)
  if input.match?(pattern) == true
    return true
  else
    return menu_number = input
  end
end

#関数値、期待値でない場合はBoolean型、期待値ならString型
menu_number = normalized(input, pattern)

puts "入力したのは: #{input} です。"

case 
when menu_number == true
puts "#{input} はメニューにありません。入力しなおしてください"
end



#プログラムを終了を処理
answer = Readline.readline("本当に終了しますか(y/n) :") if menu_number == "4" 
break if answer == 'y'


#メモの保存先のディレクトリを指定
dir_path = './log'


#メニューを分岐させる処理
case
#メモを作成する処理
when menu_number == "1"

#入力で受け取った値を評価して結果がtureになるまで処理を繰り返す
loop do

    #メモの保存ディレクトリを配列化
    file_dir = Dir.entries(dir_path)
  
    #dropメソッドで不要な要素を取り除いて配列を生成
    file_dir = file_dir.drop(2)

#入力で値を受け取る
  file_name = Readline.readline("メモのタイトルを入力してください。＞ :")

  #file_nameを正規表現でマッチング、変数に真偽値を格納
  normalized_input = file_name.match?(pattern)

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
  file_path = File.join(dir_path, file_name)
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

#メモを削除する処理
when menu_number == "2"
  puts "メモのタイトル一覧"

  #メモの保存ディレクトリを配列化
  file_dir = Dir.entries(dir_path)
  
  #不要な要素を取り除いて、配列を再生成
  file_dir = file_dir.drop(2)
  
   #メモの保存ディレクトリを標準出力
  file_dir.each do |file| 
    puts file
  end
  
  #メモのタイトルがディレクトリに存在するタイトルが入力されたら戻り値をtureを返してる繰り返しの処理を抜ける
  loop do
  #メモのタイトルを標準入力で受け取る
  file_name = Readline.readline("削除したいファイル名を入力してください。＞ :")

#file_nameを正規表現でマッチング、変数に真偽値を格納
normalized_input = file_name.match?(pattern)
    
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
  file_path = File.join(dir_path, file_name)
  File.delete(file_path)
  puts "#{file_name}を削除しました。" if File.delete == 0
  else
    puts "ファイル名が存在しません。もう一度入力してください。"
  end
  
  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == true
  #メモを表示するのループ終了
end

#メモの内容を表示する処理
when menu_number == "3"
  puts "メモのタイトル一覧"
  #メモの保存ディレクトリを配列化
  file_dir = Dir.entries(dir_path)
  
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
  normalized_input = file_name.match?(pattern)
  
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
  file_path = File.join(dir_path, file_name)
  file = File.read(file_path)
  puts file
  else
    puts "ファイル名が存在しません。もう一度入力してください。"
  end
  
  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == true
  #メモを表示するのループ終了
end

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
