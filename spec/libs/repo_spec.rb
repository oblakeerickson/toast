require 'spec_helper'

describe Repo do

	before do
		@repo = Repo.new
		@test_repo = "test_repo"
	end

	subject { @repo }

	it "creates a repo" do
		my_repo = @repo.create @test_repo
		expect(my_repo.name).to eq @test_repo
		@repo.delete my_repo.name
	end

	it "checks if a repo exists" do
		my_repo = @repo.create @test_repo
	  status = @repo.exists?(my_repo.name)
	  expect(status).to be true
	  @repo.delete my_repo.name
	end

	it "deletes a repo" do
		my_repo = @repo.create @test_repo
		status = @repo.delete my_repo.name
		expect(status).to be true
	end

	it "creates a branch" do
		my_repo = @repo.create @test_repo
		status = @repo.create_branch 'gh-pages'
		expect(status).to be true
	end

	# it "sets the default branch" do
	# 	my_repo = @repo.create @test_repo
	# 	status = @repo.set_default_branch 'gh-pages'
	# 	expect(status).to be true
	# 	@repo.delete my_repo.name
	# end

	after do
		@test_repo = "test_repo"
		if @repo.exists? @test_repo
			@repo.delete "test_repo"
		end
	end
end