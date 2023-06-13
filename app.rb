require "readline"

#ループ文開始
loop do 

#メニュー
puts "■ ■ ■ ■ ■ StudyLogのメニュー ■ ■ ■ ■ ■"
puts "・【メモを作る】は「 1 」を入力してください"
puts "・【メモを削除する】は「 2 」を入力してください"
puts "・【メモを見る】は「 3 」を入力してください"
puts "・【※ プログラムを終了する】は「 4 」を入力してください。"

input = Readline.readline("指示を「 1 」か「 2 」か「3」か「 4 」で入力してください:").to_i
puts "入力したのは: #{input} です。"

#プログラムを終了を処理
answer = Readline.readline("本当に終了しますか(y/n) :") if input == 4 
break if answer == 'y'

#メモの保存先のディレクトリを指定
dir_path = './log'

#メニューを分岐させる処理
case
when input == 1
  #メモを作成する処理
  file_name = Readline.readline("メモのタイトルを入力してください。＞ :")
  file_path = File.join(dir_path, file_name + '.txt')
  file_create = File.new(file_path, "w")
  puts "メモを書いて下さい。"
  file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。＞ :")
  File.open(file_path, "w", 0755) do |file| file.write(file_content)
  end

when input == 2
  file_dir = Dir.entries(dir_path)
  file_dir.each do |file| 
    puts file
  end
  file_delete = Readline.readline("削除したいファイル名を入力してください。＞ :")
  file_path = File.join(dir_path, file_delete)
  File.delete(file_path)
  puts "#{file_delete}を削除しました。" if File.delete == 0

#メモの内容を表示する処理
when input == 3
  puts "メモのタイトル一覧"
  logindex = Dir.entries(dir_path)
  
  logindex.each do |entry| 
  puts entry
  end
  
  file_name = Readline.readline("メモのタイトルを入力してください。＞ :")
  file_path = File.join(dir_path, file_name)
  file = File.read(file_path)
  puts file

when answer == "n"
  #プログラム終了をキャンセルする
  puts "メニューに戻ります"
else
  #メニュー項目にない処理が行われた時に表示するメッセージ
  puts "1か2を入力してください。"
end

#ループ文終了
end