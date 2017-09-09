# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cabs = Cab.create([{number: 'KL 15 6565', contact_number: '1234567890',
  curr_lat: 11.2587531, curr_long: 75.78041},
  { number: 'KL 15 6566', contact_number: '1244567890',
    curr_lat: 11.2587531, curr_long: 75.78041},
  {number: 'KL 15 6567', contact_number: '1234567899', pink: true,
    curr_lat: 11.2587531, curr_long: 75.78041},
  {number: 'KL 15 6267', contact_number: '1234567499', pink: true,
    curr_lat: 9.9312328, curr_long: 76.26730409999999},
  {number: 'KL 15 1567', contact_number: '1234563899',
    curr_lat: 12.9715987, curr_long: 77.5945627} ])
