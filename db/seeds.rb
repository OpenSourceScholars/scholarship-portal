# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.create! do |u|
  u.email                 = 'admin@admin.com'
  u.password              = 'adminpassword'
  u.password_confirmation = 'adminpassword'
end

if admin
   puts "Created user `admin@admin.com` identified `adminpassword`"
end
