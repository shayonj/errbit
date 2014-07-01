puts "Seeding database"
puts "-------------------------------"

# Create an initial Admin User
admin_username = ENV['ADMIN_UNAME']
admin_email = ENV['ADMIN_EMAIL']
admin_pass  = ENV['ADMIN_PASS']

puts "Creating an initial admin user from the env variables."
user = User.find_or_initialize_by(:email => admin_email) do |u|
  u.name = 'Errbit Admin'
  u.password = admin_pass
  u.password_confirmation = admin_pass
end
user.username = admin_username if Errbit::Config.user_has_username

user.admin = true
user.save!
