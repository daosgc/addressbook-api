# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
  name: 'admin',
  email: 'admin@example.com',
  password: '123456789',
  is_admin: true
)

user_account = User.create(
  name: 'user',
  email: 'user@example.com',
  password: '123456789'
)

organization = Organization.create(
  economic_activity: 'Restaurant',
  business_name: 'The Krusty krab.',
  legal_representative: "Mr. Krabs"
)

Employee.create(
  user: user_account,
  organization: organization
)
