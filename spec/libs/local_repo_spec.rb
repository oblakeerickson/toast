require 'spec_helper'

describe LocalRepo do

	before do
		@local_repo = LocalRepo.new("test_repo")
	end

	subject { @local_repo }

	it "creates a gh-pages branch" do
		status = @local_repo.create_gh_pages_branch
		expect(status).to eq "Switched to branch 'gh-pages'"
	end

	after do
		FileUtils.rm_rf('/Users/blake/repo/lanyon-io/test_repo')
	end
end