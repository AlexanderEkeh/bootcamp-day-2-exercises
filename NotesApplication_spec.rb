require 'minitest/autorun'
require_relative 'NotesApplication'

describe 'NotesApplication'  do
	before do
		@na = NotesApp::NotesApplication.new("AuthorName", note_arr="New NoTe to add")
		@note_arr = []
		@note_arr.push(note_arr)
	end

	it "Increments note array size" do
		a = @na.get_size
		@na.create("New note")
		(@na.get_size - a).must_equal 1
	end

	it "raise Argument error on empty note" do
		str = ""
		proc {@na.create(str)}.must_raise ArgumentError
	end

	it "finds individual search term" do
		@na.search("new").must_equal true
	end

	it "finds substring of search term" do
		@na.search("ad").must_equal true
	end

	it "accepts wrong capitalization in search term" do
		@na.search("note").must_equal true
	end

	it "ArgumentError for integer inputs" do
		proc {@na.search(Fixnum)}.must_raise ArgumentError
	end

	it "ArgumentError for Array inputs" do
		proc {@na.search(Array)}.must_raise ArgumentError
	end

	it "ArgumentError for boolean inputs" do
		proc {@na.search(TrueClass)}.must_raise ArgumentError
	end

	it "ArgumentError for boolean inputs" do
		proc {@na.search(FalseClass)}.must_raise ArgumentError
	end

	it "confirms delete for items in notes" do
		@na.delete(1).must_equal 0
	end

	it "no delete for items not in notes" do
		@na.delete(2).must_equal 1
	end

	it "confirms note content editing" do
		@na.edit(0, "Note change.").must_equal true
	end

	it "confirms no action on note editing" do
		@na.edit(@na.get_size + 1, "Note change.").must_equal false
	end

	it "raise ArgumentError for empty list" do
		proc {@na.list([])}.must_raise ArgumentError
	end

	it "index must be integer" do
		@na.in_type(5).must_be_instance_of Fixnum
	end

end