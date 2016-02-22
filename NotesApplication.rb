module NotesApp

	class NotesApplication
	
		def initialize(author, notes)
			@author = author
			@notes = []
			@notes.push(notes)
		end

		def create(note_content)
			raise ArgumentError unless note_content.length > 0
			@notes.push(note_content)
			puts "Note added successfully."
			puts
			return @notes.length
		end

		def list()
			raise ArgumentError unless @notes.length > 0
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
			return @notes.length
		end

		def get(note_id)
	    	note_id = in_type(note_id)
			if note_id != "" && note_id > 0
				puts "#{@notes[note_id - 1]}"
				puts
			else
				puts "Note_ID not found."
				puts
			end
		end

		def search(text)
			raise ArgumentError unless text.class == String
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
				return true
			else
				puts "No results found for search '#{text}'"
				return false
			end
		end

		def delete(note_id)
			note_id = in_type(note_id)
			if @notes.length >= note_id
				@notes.delete_at(note_id - 1)
				puts "Note with ID 00#{note_id} deleted."
				puts
				return @notes.length
			else
				puts "Note ID not found."
				puts
				return @notes.length
			end
		end

		def edit(note_id, new_content)
			reply = ""
			note_id = in_type(note_id)
			if @notes.length > note_id
				@notes[note_id - 1] = new_content
				puts "Note edited successfully."
				puts
				return true
			else
					return false
			end
		end

		#private
		def in_type(note_id)
			str = ""
			if note_id.class == Fixnum
		        str = note_id
	    	elsif note_id.class == String
	        	str = note_id.slice(1..note_id.length).to_i
		    end
	    	return str
		end

		def get_size
			return @notes.length
		end

	end
	
end


#=begin
anselm = NotesApp::NotesApplication.new("Anselm", "Today is Saturday.")
anselm.list
anselm.create("Well, today is still saturday.")
anselm.list
anselm.get("001")
anselm.get(001)
anselm.search("true")
anselm.delete(001)
anselm.list
anselm.edit(001, "Okay tomorrow is sunday.")
anselm.list
#=end

=begin
				puts "Note ID does not exist. Do you want to create it? Y/N"
				reply = gets.chomp.downcase
				if reply == "y"
					create(new_content)
				else
					puts "Note not modified."
					return "No action"
				end	
=end