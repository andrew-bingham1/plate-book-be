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

# user1 = User.create!(username: "test", email: "somethingcrazy@gmail.com", uid: "1234", token: "1234")
# user2 = User.create!(username: "test2", email: "anotheremail@gmail.com", uid: "5678", token: "5678")
# user3 = User.create!(username: "User Show Test", email: "usershow@gmail.com", uid: "12345", token: "12345")

# plate1 = Plate.create!(plate_number: "ABC-1234")
# plate2 = Plate.create!(plate_number: "MKV-1234")
# plate3 = Plate.create!(plate_number: "ABCD-1234")

# post1 = user1.posts.create!(title: "Test Post", body: "This is a test post", lat: 39.7392, lng: 104.9903)
# post2 = user1.posts.create!(title: "Test Post 2", body: "This is a test post 2", lat: 47.6062, lng: 122.3321)
# post3 = user2.posts.create!(title: "Test Post 3", body: "This is a test post 3", lat: 37.7749, lng: 122.4194)
# post4 = user2.posts.create!(title: "Test Post 4", body: "This is a test post 4", lat: 40.7128, lng: 74.006)
# post5 = user3.posts.create!(title: "Test Post 5", body: "This is a test post 5", lat: 32.7767, lng: 96.7970)

# comment1 = user3.comments.create!(body: "This is a test comment", user_id: user3.id, post_id: 1)

# user_plate1 = UserPlate.create!(user_id: user3.id, plate_id: plate3.id)

# post_plate1 = PlatePost.create!(post_id: post1.id, plate_id: plate1.id)
# post_plate2 = PlatePost.create!(post_id: post2.id, plate_id: plate1.id)
# post_plate3 = PlatePost.create!(post_id: post3.id, plate_id: plate2.id)
# post_plate4 = PlatePost.create!(post_id: post4.id, plate_id: plate2.id)
# post_plate5 = PlatePost.create!(post_id: post5.id, plate_id: plate3.id)

@user_1 = User.create!(username: "User 1", email: "user1@gmail.com", uid: "1234", token: "1234")
  @user_2 = User.create!(username: "User 2", email: "user2@gmail.com", uid: "5678", token: "5678")

  @plate_1 = Plate.create!(plate_number: "ABC-1234")
  @plate_2 = Plate.create!(plate_number: "DEF-1234")
  @plate_3 = Plate.create!(plate_number: "GHI-1234")
  @plate_4 = Plate.create!(plate_number: "JKL-1234")
  @plate_5 = Plate.create!(plate_number: "MNO-1234")
  @plate_6 = Plate.create!(plate_number: "PQR-1234")
  @plate_7 = Plate.create!(plate_number: "STU-1234")
  @plate_8 = Plate.create!(plate_number: "VWX-1234")
  @plate_9 = Plate.create!(plate_number: "YYY-1234")
  @plate_10 = Plate.create!(plate_number: "ZZZ-1234")

  @post_1 = @plate_1.posts.create!(title: "Test Post 1", body: "This is a test post 1", user_id: @user_1.id)
  @post_2 = @plate_1.posts.create!(title: "Test Post 2", body: "This is a test post 2", user_id: @user_1.id)
  @post_3 = @plate_1.posts.create!(title: "Test Post 3", body: "This is a test post 3", user_id: @user_1.id)

  @post_4 = @plate_2.posts.create!(title: "Test Post 4", body: "This is a test post 4", user_id: @user_1.id)
  @post_5 = @plate_2.posts.create!(title: "Test Post 5", body: "This is a test post 5", user_id: @user_1.id)
  @post_6 = @plate_2.posts.create!(title: "Test Post 6", body: "This is a test post 6", user_id: @user_1.id)

  @post_7 = @plate_3.posts.create!(title: "Test Post 7", body: "This is a test post 7", user_id: @user_1.id)
  @post_8 = @plate_3.posts.create!(title: "Test Post 8", body: "This is a test post 8", user_id: @user_1.id)

  @post_9 = @plate_4.posts.create!(title: "Test Post 9", body: "This is a test post 9", user_id: @user_1.id)

  @post_10 = @plate_5.posts.create!(title: "Test Post 10", body: "This is a test post 10", user_id: @user_1.id)
  @post_11 = @plate_5.posts.create!(title: "Test Post 11", body: "This is a test post 11", user_id: @user_1.id)
  @post_12 = @plate_5.posts.create!(title: "Test Post 12", body: "This is a test post 12", user_id: @user_1.id)
  @post_13 = @plate_5.posts.create!(title: "Test Post 13", body: "This is a test post 13", user_id: @user_1.id)

  @post_14 = @plate_6.posts.create!(title: "Test Post 14", body: "This is a test post 14", user_id: @user_1.id)
  @post_15 = @plate_6.posts.create!(title: "Test Post 15", body: "This is a test post 15", user_id: @user_1.id)
  @post_16 = @plate_6.posts.create!(title: "Test Post 16", body: "This is a test post 16", user_id: @user_1.id)
  @post_17 = @plate_6.posts.create!(title: "Test Post 17", body: "This is a test post 17", user_id: @user_1.id)

  @post_18 = @plate_7.posts.create!(title: "Test Post 18", body: "This is a test post 18", user_id: @user_1.id)
  @post_19 = @plate_7.posts.create!(title: "Test Post 19", body: "This is a test post 19", user_id: @user_1.id)
  @post_20 = @plate_7.posts.create!(title: "Test Post 20", body: "This is a test post 20", user_id: @user_1.id)
  @post_21 = @plate_7.posts.create!(title: "Test Post 20", body: "This is a test post 20", user_id: @user_1.id)
  @post_22 = @plate_7.posts.create!(title: "Test Post 20", body: "This is a test post 20", user_id: @user_1.id)

  @post_23 = @plate_8.posts.create!(title: "Test Post 21", body: "This is a test post 21", user_id: @user_1.id)
  @post_24 = @plate_8.posts.create!(title: "Test Post 22", body: "This is a test post 22", user_id: @user_1.id)
  @post_25 = @plate_8.posts.create!(title: "Test Post 23", body: "This is a test post 23", user_id: @user_1.id)

  @post_26 = @plate_9.posts.create!(title: "Test Post 24", body: "This is a test post 24", user_id: @user_1.id)
  @post_27 = @plate_9.posts.create!(title: "Test Post 25", body: "This is a test post 25", user_id: @user_1.id)
  @post_28 = @plate_9.posts.create!(title: "Test Post 26", body: "This is a test post 26", user_id: @user_1.id)

  @post_29 = @plate_10.posts.create!(title: "Test Post 27", body: "This is a test post 27", user_id: @user_1.id)
  @post_30 = @plate_10.posts.create!(title: "Test Post 28", body: "This is a test post 28", user_id: @user_1.id)
  @post_31 = @plate_10.posts.create!(title: "Test Post 29", body: "This is a test post 29", user_id: @user_1.id)

  @comment_1 = @post_4.comments.create!(body: "Comment 1", user_id: @user_2.id)
  @comment_2 = @post_5.comments.create!(body: "Comment 2", user_id: @user_2.id)
  @comment_3 = @post_6.comments.create!(body: "Comment 3", user_id: @user_2.id)
  @comment_4 = @post_6.comments.create!(body: "Comment 4", user_id: @user_2.id)
  @comment_5 = @post_10.comments.create!(body: "Comment 5", user_id: @user_2.id)
  @comment_18 = @post_18.comments.create!(body: "Comment 6", user_id: @user_2.id)
  @comment_19 = @post_19.comments.create!(body: "Comment 7", user_id: @user_2.id)
  @comment_20 = @post_20.comments.create!(body: "Comment 8", user_id: @user_2.id)
  @comment_9 = @post_26.comments.create!(body: "Comment 9", user_id: @user_2.id)
  @comment_10 = @post_27.comments.create!(body: "Comment 10", user_id: @user_2.id)
  @comment_11 = @post_28.comments.create!(body: "Comment 11", user_id: @user_2.id)
