require 'simplecov'
SimpleCov.start

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end

def test_data_posts
  @user_1 = User.create!(username: "User 1", email: "user1@gmail.com", uid: "1234", token: "1234")
  @user_2 = User.create!(username: "User 2", email: "user2@gmail.com", uid: "5678", token: "5678")
  @user_3 = User.create!(username: "User 3", email: "user3@gmail.com", uid: "9101", token: "9101")
  @plate_1 = Plate.create!(plate_number: "ABC-1234")
  @plate_2 = Plate.create!(plate_number: "DEF-5678")
  @plate_1.posts.create!(title: "Test Post 1", body: "This is a test post", user_id: @user_1.id)
  @plate_2.posts.create!(title: "Test Post 2", body: "This is a test post 2", user_id: @user_2.id)
  @plate_1.posts.create!(title: "Test Post 3", body: "This is a test post 3", user_id: @user_1.id)
  @plate_2.posts.create!(title: "Test Post 4", body: "This is a test post 4", user_id: @user_2.id)
end

def test_data_hot
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

  @comment_1 = @post_2.comments.create!(body: "Comment 1", user_id: @user_2.id)
  @comment_2 = @post_2.comments.create!(body: "Comment 2", user_id: @user_2.id)
  @comment_3 = @post_2.comments.create!(body: "Comment 3", user_id: @user_2.id)
  @comment_4 = @post_2.comments.create!(body: "Comment 4", user_id: @user_2.id)
  @comment_5 = @post_5.comments.create!(body: "Comment 5", user_id: @user_2.id)
  @comment_6 = @post_7.comments.create!(body: "Comment 6", user_id: @user_2.id)
  @comment_7 = @post_7.comments.create!(body: "Comment 7", user_id: @user_2.id)
  @comment_8 = @post_7.comments.create!(body: "Comment 8", user_id: @user_2.id)
  @comment_9 = @post_9.comments.create!(body: "Comment 9", user_id: @user_2.id)
  @comment_10 = @post_9.comments.create!(body: "Comment 10", user_id: @user_2.id)
  @comment_11 = @post_9.comments.create!(body: "Comment 11", user_id: @user_2.id)
end