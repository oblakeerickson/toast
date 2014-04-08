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
