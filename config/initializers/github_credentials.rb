def get_username
  username_file = '.username'
  File.read(username_file).chomp
end
def get_password
  password_file = '.password'
  File.read(password_file).chomp
end

OrEquals::Application.config.github_username = get_username
OrEquals::Application.config.github_password = get_password