require 'spec_helper'

describe Connection do

  before do
  	@connection = Connection.new
  end

  subject { @connection }

  it { should respond_to(:username) }

  it "returns a GitHub user" do
  	client = @connection.user "mojombo"
  	expect(client.id).to eq 1
  end

  it "returns an integer for the rate limit" do
  	rate_limit = @connection.rate_limit "mojombo"
  	expect(rate_limit).to be_kind_of(Integer)
  end

  it "returns the username in the .username file" do
  	username = @connection.username
  	expect(username).to eq OrEquals::Application.config.github_username
  end
end
