require "readline"

#メニューを表示する
puts "StudyLogのメニュー"
puts "・メモを書く は「 1 」と入力してください"
puts "・メモを見る は「 2 」と入力してください"
input = Readline.readline("指示を「 1 」か「 2 」で入力してください:").to_i
puts "入力したのは: #{input} です。"

#メニューを分岐させる処理
if input == 1
#ファイルに書き込む処理
  puts "・メモを書いてください。"
  content = Readline.readline("メモを入力してEnterを押すと保存されます :")
  File.open("log.txt", "w", 0755) do |file| file.write(content)
  end
elsif input == 2 
#ファイルの中身を表示する処理
  puts "・メモをご覧ください。"
  f = File.read("log.txt")
  puts f
else
  puts "1か2を入力してください。"
end


=begin
#業務一覧
メニューを表示する
・処理を分岐する
1.メモを書く
2.メモを見る
・業務課題
1.メニューでユーザーからの指示を促すメッセージをプロンプト上に表示したい
関数の処理の組み立て方がわからない。



・メモを書くの処理
1.入力値を受け取る
保存する
2.メニューに戻るを表示する
・メモを見る
1.メモを表示
2.メニューに戻る


状況
できたこと
・ユーザーからの入力値を受け取る
・ファイルを開いて入力値を書き込む
・ファイルの内容をターミナルへ表示


#備考
・標準入力
→行の読み取り
hoge = readline
puts (hoge)

→ファイルの中身を読み取り
f = File.read('log.txt')

puts f

書き込みの処理
Fileクラスのdocs
https://docs.ruby-lang.org/ja/2.7.0/class/File.html#S_WRITABLE--3F

openメソッドのdocs
https://docs.ruby-lang.org/ja/2.7.0/class/File.html#S_NEW

ブロック付きのメソッドの呼び出し
https://docs.ruby-lang.org/ja/2.7.0/doc/spec=2fcall.html
※ブロック付きのメソッドの理解がしっくり来ない。

実装できなかった処理
#プロンプトでユーザーに入力を促す関数
def prompt(message = "指示を「 1 」か「 2 」で入力してください:")
  puts message
end


=end
