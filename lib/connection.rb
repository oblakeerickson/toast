class Connection

  def initialize
    @client = Octokit::Client.new :login => get_username, :password => get_password
  end

  def client
    @client
  end

  def username
    @client.login
  end

  def user(username)
    @client.user username
  end

  def rate_limit(username)
    @client.user username
    response = @client.last_response
    @rate_limit = response.headers[:'x-ratelimit-remaining'].to_i
  end

  private

  def get_username
    Toast::Application.config.github_username
  end

  def get_password
    Toast::Application.config.github_password
  end
end