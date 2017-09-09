== README

This README documents necessary steps to get callTaxi up and running.

=== Ruby version
  Ruby 2.4.1

=== System dependencies
* PostgreSQL 9.4.9 or above

=== Databse.yml
  Edit username and password for database.
  rake db:setup
  rails db:migrate
  rails db:seed

=== How to run the test suite
  Test suit used is mini test
  ruby -Ilib:test test/models/*.rb
  ruby -Ilib:test test/controllers/*.rb
  ruby -Ilib:test test/helpers/*.rb

  eg: ruby -Ilib:test test/models/ride_test.rb
