require "readline"

#ファイルに書き込む処理
  puts "・メモを書いてください。"
  content = Readline.readline("メモを入力してEnterを押すと保存されます :")
  File.open("log.txt", "w", 0755) do |file| file.write(content)
  end
