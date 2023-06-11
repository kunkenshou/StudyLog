require 'readline'

#プログラムが終了しないように処理を繰り返す
loop do

puts "・【メモを一覧】"
puts "・【メモの一覧を見る】は「 1 」と入力してください。"
puts "・【メモを見る】は「 2 」と入力してください"
puts "・【メニューに戻る】は「 3 」と入力してください"
index_input = Readline.readline("メニューを入力してください :").to_i

dir_path = './log'

#メニューに戻る
puts "メニューに戻ります" if index_input == 3
break if index_input == 3

case
#メモ一覧を表示の処理
when index_input == 1
logindex = Dir.entries(dir_path)

logindex.each do |entry| 
puts entry
end

#メモを見る処理
when index_input == 2
file_name = Readline.readline("ファイル名を入力してください。 :")

file_path = File.join(dir_path, file_name)

file = File.read(file_path)
puts file

end

#繰り返しの処理の末端
end