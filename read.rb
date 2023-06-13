require 'readline'

#プログラムが終了しないように処理を繰り返す
loop do

puts "■ ■ メモを閲覧のメニュー ■ ■"
puts "・【メモを見る】は「 1 」を入力してください。"
puts "・【メモを作る】は「 2 」を入力してください。"
puts "・【メニューに戻る・プログラムを終了】は「 3 」を入力してください。"
index_input = Readline.readline("メニューを入力してください :").to_i

dir_path = './log'

#メニューに戻る・プログラムを終了する処理
#メニューに戻る・プログラムを終了する処理
puts "メニューに戻ります" if index_input == 3
break if index_input == 3
load "app.rb" if index_input == 3

case
#メモ一覧を表示の処理
when index_input == 1
puts "メモのタイトル一覧"
logindex = Dir.entries(dir_path)

logindex.each do |entry| 
puts entry
end

file_name = Readline.readline("メモのタイトルを入力してください。 :")
file_path = File.join(dir_path, file_name)
file = File.read(file_path)
puts file

end

#繰り返しの処理の末端
end


#テスト
