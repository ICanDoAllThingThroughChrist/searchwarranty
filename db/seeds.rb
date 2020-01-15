# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# CSV.foreach("C:/Users/e128289/Documents/311-open-data-monthly.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
#   # binding.pry
#  Sr.create(row.to_hash)
#  # binding.pry
# }

CSV.foreach("C:/Users/e128289/Documents/311-open-data-annual.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) {|row|
  # binding.pry
 Sr.create(row.to_hash)
 # binding.pry
}
