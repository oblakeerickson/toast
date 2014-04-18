require 'spec_helper'

describe Baseurl do

	before do
		@path = 'tmp'
		@org = 'lanyon-io'
		@name = 'test_repo'
		FileUtils.mkdir_p "#{@path}/#{@org}"
		@local_repo = LocalRepo.new(@path, @org, @name)
		@baseurl = Baseurl.new(@path, @org, @name)
	end

	subject { @baseurl }

	it "changes the baseurl" do
		yml = @baseurl.change_config
		new_yml = YAML::load_file("#{@path}/#{@org}/#{@name}/_config.yml")
		expect(new_yml['baseurl']).to eq "/#{@name}"
	end

	it "changes the poole.css line" do
		status = false
		poole = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "poole.css"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the syntax.css line" do
		status = false
		syntax = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "syntax.css"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the hyde.css line" do
		status = false
		syntax = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "hyde.css"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the apple-touch line" do
		status = false
		syntax = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "apple-touch-icon-precomposed"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the favicon icon line" do
		status = false
		syntax = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "favicon.ico"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the atom RSS line" do
		status = false
		syntax = @baseurl.change_head
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/head.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "atom.xml"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the home page link line" do
		status = false
		syntax = @baseurl.change_sidebar
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/sidebar.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/sidebar.html", 'w')

		contents.each do |line|
			if line.include? ">Home</a>"
				if line.include? "baseurl"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the note.title line" do
		status = false
		syntax = @baseurl.change_sidebar
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/sidebar.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/sidebar.html", 'w')

		contents.each do |line|
			if line.include? "{{ node.title }}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the note.title line" do
		status = false
		syntax = @baseurl.change_sidebar
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_includes/sidebar.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_includes/sidebar.html", 'w')

		contents.each do |line|
			if line.include? "{{ node.title }}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the post url line" do
		status = false
		syntax = @baseurl.change_post_layout
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_layouts/post.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_layouts/post.html", 'w')

		contents.each do |line|
			if line.include? "{{ post.url }}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the post url line" do
		status = false
		syntax = @baseurl.change_post_layout
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/_layouts/post.html")
		file = File.open("#{@path}/#{@org}/#{@name}/_layouts/post.html", 'w')

		contents.each do |line|
			if line.include? "{{ post.url }}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the index post url line" do
		status = false
		syntax = @baseurl.change_index
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/index.html")
		file = File.open("#{@path}/#{@org}/#{@name}/index.html", 'w')

		contents.each do |line|
			if line.include? "{{ post.url }}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the pagination next line" do
		status = false
		syntax = @baseurl.change_index
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/index.html")
		file = File.open("#{@path}/#{@org}/#{@name}/index.html", 'w')

		contents.each do |line|
			if line.include? "{{paginator.next_page}}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the pagination previous line" do
		status = false
		syntax = @baseurl.change_index
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/index.html")
		file = File.open("#{@path}/#{@org}/#{@name}/index.html", 'w')

		contents.each do |line|
			if line.include? "{{paginator.previous_page}}"
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	it "changes the pagination newer line" do
		status = false
		syntax = @baseurl.change_index
		contents = IO.readlines("#{@path}/#{@org}/#{@name}/index.html")
		file = File.open("#{@path}/#{@org}/#{@name}/index.html", 'w')

		contents.each do |line|
			if line.include? '/">Newer</a>'
				if line.include? "{{ site.baseurl }}"
					status = true
				end
			end
		end

		file.close
		expect(status).to be true
	end

	after do
		FileUtils.rm_f("#{@path}/#{@org}/#{@name}/_config.yml")
		FileUtils.rm_rf("#{@path}/#{@org}/#{@name}")
		FileUtils.rm_rf("#{@path}/#{@org}")
	end
end
