require "readline"

#ループ開始
loop do
puts "■ ■ メモを書き込み・編集 ■ ■"
puts "・【メモの作成】は「 1 」を入力してください"
puts "・【メモの削除】は「 2 」を入力してください"
puts "・【メニューに戻る】は「 3 」を入力してください"

write_input = Readline.readline("指示を「 1 」か「 2 」か「3」で入力してください:").to_i

puts "メニューに戻ります。" if write_input == 3
break if write_input == 3

dir_path = './log'


#メニューの処理
case
when write_input == 1
file_name = Readline.readline("ファイル名を入力してください :")
file_path = File.join(dir_path, file_name + '.txt')
file_create = File.new(file_path, "w")
puts "メモを書いて下さい。"
file_content = Readline.readline("メモを入力してください。Enterを押すと保存されます。 :")
File.open(file_path, "w", 0755) do |file| file.write(file_content)
end
when write_input == 2
  file_delete = Readline.readline("削除したいファイル名を入力してください")
file_path = File.join(dir_path, file_delete)
File.delete(file_path)
puts "#{file_delete}を削除しました" if File.delete == 1
end
=begin
#ファイルに書き込む処理
  puts "・メモを書いてください。"
  content = Readline.readline("メモを入力してEnterを押すと保存されます :")
  File.open("./log/log.txt", "w", 0755) do |file| file.write(content)
  end
=end

#ループ終了
end