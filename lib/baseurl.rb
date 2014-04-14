require 'yaml'

class Baseurl

	def initialize(path, org, repo)
		@repo = repo
		@full_path = "#{path}/#{org}/#{repo}"
	end

	def change_config
		yml = load
		modify(yml, "/#{@repo}")
		save(yml)
	end

	def change_head
		contents = IO.readlines("#{@full_path}/_includes/head.html")

		file = File.open("#{@full_path}/_includes/head.html", 'w')

		contents.each do |line|
			if line.include? "poole.css"
				file.write('<link rel="stylesheet" href="{{ site.baseurl }}/public/css/poole.css">')
			else
				file.write(line)
			end
		end

		file.close
	end

	private

	def load
		YAML::load_file("#{@full_path}/_config.yml")
	end

	def modify(yml, baseurl)
		yml['baseurl'] = baseurl
	end

	def save(yml)
		File.open("#{@full_path}/_config.yml", 'w') do |f|
			f.write yml.to_yaml
		end
	end
end
