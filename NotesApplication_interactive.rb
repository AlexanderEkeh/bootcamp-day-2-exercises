#=begin
module NotesApp

	class NotesApplication
	
		def initialize(author, notes)
			@author = author
			@notes = []
			@notes.push(notes)
		end

		def create(note_content)
			@notes.push(note_content)
			puts "Note added successfully."
			puts
		end

		def list()
			if @notes.length > 0
				@notes.each_with_index do |note, index|
					puts "Note ID: 00#{index.to_i + 1}"
					puts "#{note}"
					puts
					puts "By Author #{@author}"
					puts
				end
			else
				puts "No notes to display."
				puts
			end
		end

		def get(note_id)
	    	note_id = in_type(note_id)
			if note_id > 0
				puts "#{@notes[note_id - 1]}"
				puts
			else
				puts "Note_ID not found."
				puts
			end
		end

		def search(text)
		    text.downcase!
			found = []
			out = false
			@notes.each_with_index do |note, index|
			    out = false
				words = note.split(" ")
				words.each do |word|
					if (word.length >= text.length) && (word.downcase.include? text)
						found.push(index)
						break
					end
				end
			end
			if found.length > 0
		    	puts "Showing #{found.length} result(s) for search '#{text}'"
				puts
				found.each do |item|
					puts "Note ID: 00#{item + 1}"
					puts @notes[item]
					puts
					puts "By Author #{@author}"
					puts
				end
			else
				puts "No results found for search '#{text}'"
			end
		end

		def delete(note_id)
			note_id = in_type(note_id)
			if @notes.length >= note_id
				@notes.delete_at(note_id - 1)
				puts "Note with ID 00#{note_id} deleted."
				puts
			else
				puts "Note ID not found."
				puts
			end
		end

		def edit(note_id, new_content)
			reply = ""
			note_id = in_type(note_id)
			if @notes.length > (note_id - 1)
				@notes[note_id - 1] = new_content
				puts "Note edited successfully."
				puts
			else
				puts "Note ID does not exist. Do you want to create it? Y/N"
				reply = gets.chomp.downcase
				if reply == "y"
					@notes.push(new_content)
					puts "Note created."
					puts
				end
			end
		end

		def in_type(note_id)
			str = ""
			if note_id.class == Fixnum
		        str = note_id
	    	else
	        	str = note_id.to_i
		    end
	    	return str.to_i
		end

	end
	
end
#=end
rep = ""
puts "WELCOME TO YOUR PERSONAL NOTE TAKING APPLICATION."
puts "Please enter your name: "
name = gets.chomp
name.capitalize!
autho = NotesApp::NotesApplication.new(name, "I created a new note.")
puts "We've added a note for you, 'I created a new note.'. Would you like to edit it? Y/N"
rep = gets.chomp.downcase
if rep == 'y'
	puts "Enter a new note: "
	rep = gets.chomp
	autho.edit(0, rep)
end
while true do
	puts "Note Application Menu.".upcase
	puts "A: To create a new note."
	puts "B: To view a note."
	puts "C: To list all notes."
	puts "D: To search for a text."
	puts "E: To edit a note."
	puts "F: To delete a note."
	puts
	puts "Q: To quit the application."
	input = gets.chomp.downcase
	case input
	when 'a'
		puts "Type your note here: "
		autho.create(gets.chomp)
	when 'b'
		puts "What is the index of the note you wish to view?"
		autho.get(gets.chomp)
	when 'c'
		autho.list
	when 'd'
		puts "Enter a text to search for: "
		autho.search(gets.chomp)
	when 'e'
		puts "What is the index of the note you wish to edit?"
		inde = gets.chomp
		puts "Enter the new note: "
		new_no = gets.chomp
		autho.edit(inde, new_no)
	when 'f'
		puts "Enter the index of the note to delete."
		autho.delete(gets.chomp)
	when 'q'
		puts "Thank you for using our app."
		break
	else
		puts "Invalid selection, try again."
	end
end