
#共通部分

#入力値の正規化用のパターン、読み込み処理、削除用
$pattern = /[%.+\/\p{Space}\s]/

#入力値の正規化用のパターン、書き込み用
$pattern1 = /[%+\/\p{Space}\s]/

#メニューの番号
$menu_array = Array(["1", "2", "3", "4", "5"])



#メモの保存先のディレクトリを指定
$dir_path = './log'

#メモの保存ディレクトリを配列化
$file_dir = Dir.entries($dir_path)

#不要な要素を取り除いて、配列を再生成
#test.txtを作成しテストしたところ[".", "test.txt", ".."]添字(2)なので$file_dirには".."が代入されてうまく動かないみたいです。normalized.rbも同様っぽいです
$file_dir = $file_dir.drop(2)

