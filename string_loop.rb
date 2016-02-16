count  = 1
name = "Ikechukwunyeremefuna".upcase!.split("")
name.each do |e|
	puts "#{count} #{e}"
	count +=1
end