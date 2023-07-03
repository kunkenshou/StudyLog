#共通部分

#メモを表示、作成、削除、書き換えの正規化
$pattern = /[%.+\/\p{Space}\s]/

#メニューの入力値正規化
$menu_pattern = /\b[12345]\b/

#メニューの番号
$menu_array = Array(["1", "2", "3", "4", "5"])

#メモの保存先のディレクトリを指定
$dir_path = "./log"

#メモの保存ディレクトリを配列化
$file_dir = Dir.entries($dir_path)

#不要な要素を取り除いて、配列を再生成
#.dropメソッドからdifferenceメソッドに変更。dropメソッドの引数が$file_dirに代入されるのを防ぐため
$file_dir = $file_dir.difference([".", ".."])
