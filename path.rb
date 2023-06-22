
#共通部分

#標準入力で受け取った値に例外が発生させない様に正規表現を変数に代入
$pattern = /[%.+\/\p{Space}\s]/

#メニューの番号
$menu_array = Array(["1", "2", "3", "4"])

#メモの保存先のディレクトリを指定
$dir_path = './log'

#メモの保存ディレクトリを配列化
$file_dir = Dir.entries($dir_path)

#不要な要素を取り除いて、配列を再生成
$file_dir = $file_dir.drop(2)


#$input_length = $input.length

$hoge = "リトルインディアン"
