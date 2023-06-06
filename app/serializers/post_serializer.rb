class PostSerializer
  include JSONAPI::Serializer
  attributes :id,
             :title,
             :body,
             :user_id,
             :created_at,
             :updated_at
  
  attributes :plate_posts do |post|
    post.plate_posts.map do |plate_post|
      {photo_url: plate_post.photo_url}
    end
  end

  attributes :username do |post|
     post.user.username
  end
  
  attribute :comments do |post|
    post.comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        user_id: comment.user_id,
        post_id: comment.post_id,
        username: comment.user.username,
        created_at: comment.created_at.localtime.strftime("%-I:%M %p %m/%d/%Y")
      }
    end
  end

  attribute :parent_plates do |object|
    object.plates.map do |plate|
      {
        plate_number: plate.plate_number
      }
    end
  end

  attribute :formatted_created_at do |post|
    post.created_at.localtime.strftime("%-I:%M %p %m/%d/%Y")
  end
end