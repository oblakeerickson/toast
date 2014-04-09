require 'spec_helper'

describe LocalRepo do

	before do
		@local_repo = LocalRepo.new("test_repo")
	end

	subject { @local_repo }

	it "contains the default theme" do
		yml = YAML::load_file("/Users/blake/repo/lanyon-io/test_repo/_config.yml")
		expect(yml['title']).to eq 'Hyde'
	end

	it "creates a gh-pages branch" do
		status = @local_repo.create_gh_pages_branch
		expect(status).to eq "Switched to branch 'gh-pages'"
	end

	after do
		FileUtils.rm_rf('/Users/blake/repo/lanyon-io/test_repo')
	end
end