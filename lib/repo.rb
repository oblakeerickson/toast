class Repo

	def initialize
		@connection = Connection.new
		@client = @connection.client
    @org = 'lanyon-io'
	end

	def create(name)
    options = { :organization => @org }
    begin
      @client.create_repository name, options
    rescue
      "error"
    end
  end

  def exists?(name)
    @client.repository?(repo name) ? true : false
  end

  def delete(name)
    @client.delete_repo repo name
  end

  def list
    list = @client.org_repos(@org, {:type => 'public'})
    list.each do |r|
      puts r.name
    end
  end

  def clone(name)
    url = "git@github.com:poole/hyde.git"
    path = "/Users/blake/repo/#{@org}/#{name}"
    @g = Git.clone(url, path)
  end

  def gh_pages
    @g.branch('gh-pages').checkout
  end

  private

  def repo(name)
    Octokit::Repository.new "#{@org}/#{name}"
  end
end