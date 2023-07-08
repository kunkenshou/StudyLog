#共通部分

#メモを表示、作成、削除、書き換えの正規化
$pattern = /[%.+\/\p{Space}\s]/

#メニューの入力値正規化
$menu_pattern = /\b[12345]\b/

#メニューの番号
$menu_array = Array(["1", "2", "3", "4", "5"])

#メモの保存先のディレクトリを指定
$dir_path = './log'

#メモの保存ディレクトリを配列化
$file_dir = Dir.entries($dir_path).difference([".", ".."])

