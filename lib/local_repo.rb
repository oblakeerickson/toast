class LocalRepo

	def initialize(path, org, name)
		@org = org
		@path = path
		@theme = 'git@github.com:poole/hyde.git'
		@g = create name
	end

	def create_gh_pages_branch
		@g.branch('gh-pages').checkout
	end

	private

	def create(name)
		Git.clone(@theme, full_path(name))
	end

	def full_path(name)
		"#{@path}/#{@org}/#{name}"
	end
end
