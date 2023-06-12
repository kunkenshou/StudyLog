require "readline"

#ループ開始
loop do
puts "■ ■ メモを書き込み・編集のメニュー ■ ■"
puts "・【メモの作成】は「 1 」を入力してください"
puts "・【メモの削除】は「 2 」を入力してください"
puts "・【メモの見る】は「 3 」を入力してください"
puts "・【メニューに戻る・プログラムを終了する】は「 4 」を入力してください"

write_input = Readline.readline("指示を入力してください:").to_i

dir_path = './log'

#メニューに戻る・プログラムを終了する処理
puts "メニューに戻ります" if write_input == 4
break if write_input == 4
load "app.rb" if write_input == 4

#メニューの処理
case
when write_input == 1
  #メモを作成する処理
file_name = Readline.readline("メモのタイトルを入力してください :")
file_path = File.join(dir_path, file_name + '.txt')
file_create = File.new(file_path, "w")
puts "メモを書いて下さい。"
file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。 :")
File.open(file_path, "w", 0755) do |file| file.write(file_content)
end
when write_input == 2
  #メモを削除する処理
file_dir = Dir.entries(dir_path)
file_dir.each do |file| 
  puts file
end
file_delete = Readline.readline("削除したいファイル名を入力してください :")
file_path = File.join(dir_path, file_delete)
File.delete(file_path)
puts "#{file_delete}を削除しました。" if File.delete == 0
when write_input == 3
 #メモを見る処理
  load "read.rb"
end

#ループ終了
end

