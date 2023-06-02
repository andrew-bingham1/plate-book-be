# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Plate.create(plate_number: "MKV-1234")
# Plate.create(plate_number: "USB-5678")
# Plate.create(plate_number: "ABC-1234")
# Post.create(title: "Test Post", body: "This is a test post", user_id: 1)
# Post.create(title: "Test Post 2", body: "This is a test post 2", user_id: 2)
# Post.create(title: "Test Post 3", body: "This is a test post 3", user_id: 1)

User.create(username: "test", email: "somethingcrazy@gmail.com", uid: "1234", token: "1234")
User.create(username: "test2", email: "anotheremail@gmail.com", uid: "5678", token: "5678")
x = Plate.create(plate_number: "ABC-1234")
y = Plate.create(plate_number: "MKV-1234")
x.posts.create(title: "Test Post", body: "This is a test post", user_id: 1)
x.posts.create(title: "Test Post 2", body: "This is a test post 2", user_id: 2)

y.posts.create(title: "Test Post 3", body: "This is a test post 3", user_id: 1)
y.posts.create(title: "Test Post 4", body: "This is a test post 4", user_id: 2)