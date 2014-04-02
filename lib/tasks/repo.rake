namespace :repo do
  desc "Create GitHub repo"
  task populate: :environment do
    connection = Connection.new
    repo = connection.create_repo "pickle3"
    puts repo
  end
end