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

  attributes :user do |post|
    {
      username: post.user.username
    }
  end
  
  attribute :comments do |post|
    post.comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        user_id: comment.user_id,
        post_id: comment.post_id,
        username: comment.user.username
      }
    end
  end

  attribute :parent_plates do |object|
    object.plates
  end
end