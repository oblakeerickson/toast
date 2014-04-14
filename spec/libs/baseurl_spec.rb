require 'spec_helper'

describe Baseurl do

	before do
		@baseurl = Baseurl.new("tmp", "org", "repo")
		FileUtils.mkdir_p "tmp/org/repo"
		File.open("tmp/org/repo/_config.yml", "w") do |f|
			f.write("baseurl: '/asdf'")
		end

		FileUtils.mkdir_p "tmp/org/repo/_includes"
		File.open("tmp/org/repo/_includes/head.html", "w") do |f|
			f.write('  <link rel="stylesheet" href="/public/css/poole.css">')
		end
	end

	subject { @baseurl }

	it "changes the baseurl" do
		yml = @baseurl.change_config
		new_yml = YAML::load_file("tmp/org/repo/_config.yml")
		expect(new_yml['baseurl']).to eq "/repo"
	end

	it "changes the poole.css line" do
		status = false
		poole = @baseurl.change_head
		File.open("tmp/org/repo/_includes/head.html", "r") do |f|
			line = f.gets
			if line.include? "poole.css"
				if line.include? "baseurl"
					status = true
				end
			end
		end
		expect(status).to be true
	end

	after do
		FileUtils.rm_f("tmp/org/repo/_config.yml")
		FileUtils.rm_rf("tmp/org/repo")
		FileUtils.rm_rf("tmp/org")
	end
end

