# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fen = User.create(username: 'FenFen', lastfm_username: 'praxising', photo_url: 'http://www.mondayeveningconcerts.org/images/bios/ustvolskaya.jpg', city: 'New York', password: 'querty', password_confirmation: 'querty')
ginko = User.create(username: 'Ginko', lastfm_username: 'urotomayori', photo_url: 'http://timmaughanbooks.com/wp-content/uploads/2010/04/mushishi-ginko-big.jpg', city: 'Nowhere', password: 'asdfg', password_confirmation: 'asdfg')


fen.ratios.push(
Ratio.create(lastfm_username_entry: 'noodle', city_entry: 'Seattle', country_entry: 'United States', ratio_output: 20),
Ratio.create(lastfm_username_entry: 'noop noop', city_entry: 'Albany', country_entry: 'United States', ratio_output: 85)
)
