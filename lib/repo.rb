class Repo

	def initialize
		@connection = Connection.new
		@client = @connection.client
	end

	def create(name)
    options = { :organization => "lanyon-io" }
    begin
      @client.create_repository name, options
    rescue
      "error"
    end
  end
end