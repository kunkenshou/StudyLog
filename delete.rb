#メモを削除する処理のファイル
require "./normalized.rb"
#requireでは配列が読み込まれない？
require "./path.rb"
$file_dir = Dir.entries($dir_path).difference([".", ".."])
$filename = "削除"
puts "#{$filename}するメモの一覧"

#メモの保存ディレクトリ配列、Array型が格納
dir_obj = DirClass.new
#NormalizedClassクラスからインスタンスを作成、normalizedオブジェクトを作成
normalized_obj = NormalizedClass.new

#メモの保存ディレクトリを表示
puts dir_obj.dir_path($file_dir)

#メモのタイトルがディレクトリに存在するタイトルが入力されたら戻り値をtureを返してる繰り返しの処理を抜ける
loop do
  #メモのタイトルを標準入力で受け取る
  $file_name = Readline.readline("削除したいファイル名を入力してください。＞ :")

  #関数の戻り値が変数に代入
  normalized_input = normalized_obj.title_normalized($value_exists, $normalized_input)

  #真偽値で処理を分岐、tureなら標準入力で受け取ったタイトルのメモの内容を表示する、falseならメモを見るの処理に戻る
  if normalized_input == true
    file_path = File.join($dir_path, $file_name)
    File.delete(file_path)
    puts "#{$file_name}を削除しました。" if File.delete == 0
  else
    puts "ファイル名が存在しません。もう一度入力してください。"
  end

  #file_status配列とfile_nameを比較して戻り値がtureならメモを見るの処理の繰り返しを終了
  break if normalized_input == true
  #メモを表示するのループ終了
end
