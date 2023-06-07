
input = readline
File.open("log.txt", "w", 0755) do |file| file.write(input)
end
f = File.read("log.txt")
puts f

=begin
#メモ
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


=end