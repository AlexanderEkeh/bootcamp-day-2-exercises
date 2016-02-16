name = "ikechkwunyeremefuna"
name_hash = Hash.new(0)
for i in 0...name.length
	name_hash[name[i]] += 1
end
puts name_hash
puts "STATS for the name 'IKECHUKWYNYEREMEFUNA': "
name_hash.each {|k, v| puts "#{k}:-  #{v}"}
puts ""
puts "Really short name. Lol."