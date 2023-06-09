
puts 【メモを一覧】
dir_path = './log/'
logindex = Dir.entries(dir_path)

logindex.each do |entry| 
puts entry
end
