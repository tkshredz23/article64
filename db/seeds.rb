# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Vote.destroy_all
Candidate.destroy_all
Location.destroy_all

c1 = Candidate.create(first_name: 'Tikky', last_name: 'Shiwala')
c2 = Candidate.create(first_name: 'Lionel', last_name: 'Shiwala')
c3 = Candidate.create(first_name: 'Ben', last_name: 'Shiwala')

l1 = Location.create(country: 'U.S.A', state: 'Massachussets', city: 'Boston', name: 'awa')
l2 = Location.create(country: 'U.S.A', state: 'Massachussets', city: 'Lynn', name: 'kuna')

Vote.create(location: l1, candidate: c1, online_count: 12, offline_count: 43)
Vote.create(location: l1, candidate: c2, online_count: 5, offline_count: 10)
Vote.create(location: l2, candidate: c1, online_count: 15, offline_count: 50)
Vote.create(location: l2, candidate: c2, online_count: 10, offline_count: 53)
