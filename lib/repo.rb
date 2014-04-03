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

  def create_branch(name)
    my_repo = repo name
    @client.create_ref(my_repo, "heads/gh-pages", "827efc6d56897b048c772eb4087f854f46256132")
  end

  def set_default_branch(name)
    options = { :default_branch => 'gh-pages' }
    my_repo = repo name
    @client.edit_repository(my_repo, options) ? true : false
  end

  private

  def repo(name)
    Octokit::Repository.new "#{@org}/#{name}"
  end
end