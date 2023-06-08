class PlateSerializer
  include JSONAPI::Serializer
  attributes :plate_number,
             :created_at,
             :updated_at

  attribute :posts do |plate|
    plate.posts.map do |post|
      {
        id: post.id,
        title: post.title,
        created_at: post.created_at.strftime("%-I:%M %p %m/%d/%Y"),
        username: post.user.username,
        user_id: post.user_id,
        comment_count: post.comments.count
      }
    end
  end

end