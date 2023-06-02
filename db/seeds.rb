# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "test", email: "somethingcrazy@gmail.com", uid: "1234", token: "1234")
User.create(username: "test2", email: "anotheremail@gmail.com", uid: "5678", token: "5678")