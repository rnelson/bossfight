# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates an admin user to log in with
User.create(first_name: 'Admin',
             last_name: 'User',
             email: 'admin@example.com',
             access_level: Constants.get_access_id(:admin),
             password: 'password', password_confirmation: 'password')
Boss.create(boss_id: 1, employee_id: 1)

# Create a default category
Category.create(name: 'Default')
