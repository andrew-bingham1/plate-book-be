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

user1 = User.create!(username: "test", email: "somethingcrazy@gmail.com", uid: "1234", token: "1234")
user2 = User.create!(username: "test2", email: "anotheremail@gmail.com", uid: "5678", token: "5678")
user3 = User.create!(username: "User Show Test", email: "usershow@gmail.com", uid: "12345", token: "12345")

plate1 = Plate.create!(plate_number: "ABC-1234")
plate2 = Plate.create!(plate_number: "MKV-1234")
plate3 = Plate.create!(plate_number: "ABCD-1234")

post1 = user1.posts.create!(title: "Test Post", body: "This is a test post", lat: 39.7392, lng: 104.9903)
post2 = user1.posts.create!(title: "Test Post 2", body: "This is a test post 2", lat: 47.6062, lng: 122.3321)
post3 = user2.posts.create!(title: "Test Post 3", body: "This is a test post 3", lat: 37.7749, lng: 122.4194)
post4 = user2.posts.create!(title: "Test Post 4", body: "This is a test post 4", lat: 40.7128, lng: 74.006)
post5 = user3.posts.create!(title: "Test Post 5", body: "This is a test post 5", lat: 32.7767, lng: 96.7970)

comment1 = user3.comments.create!(body: "This is a test comment", user_id: user3.id, post_id: 1)

user_plate1 = UserPlate.create!(user_id: user3.id, plate_id: plate3.id)

post_plate1 = PlatePost.create!(post_id: post1.id, plate_id: plate1.id)
post_plate2 = PlatePost.create!(post_id: post2.id, plate_id: plate1.id)
post_plate3 = PlatePost.create!(post_id: post3.id, plate_id: plate2.id)
post_plate4 = PlatePost.create!(post_id: post4.id, plate_id: plate2.id)
post_plate5 = PlatePost.create!(post_id: post5.id, plate_id: plate3.id)
