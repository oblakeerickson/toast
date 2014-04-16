require 'spec_helper'

describe LocalRepo do

	before do
		@path = '/Users/blake/repo/'
		@org = 'lanyon-io'
		@name = 'test_repo'
		@local_repo = LocalRepo.new(@path, @org, @name)
	end

	subject { @local_repo }

	it "contains the default theme" do
		yml = YAML::load_file("#{@path}/#{@org}/#{@name}/_config.yml")
		expect(yml['title']).to eq 'Hyde'
	end

	it "creates a gh-pages branch" do
		status = @local_repo.create_gh_pages_branch
		expect(status).to eq "Switched to branch 'gh-pages'"
	end

	after do
		FileUtils.rm_rf("#{@path}/#{@org}/#{@name}")
	end
end
