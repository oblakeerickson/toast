namespace :repo do
  desc "Create GitHub repo"
  task populate: :environment do
    repo = Repo.new
    new_repo = repo.create "pickle6"
    puts new_repo
  end
end