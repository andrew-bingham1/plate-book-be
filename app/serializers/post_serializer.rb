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
      photo_url: plate_post.photo_url
    end
  end
  
  attribute :comments do |post|
    post.comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        user_id: comment.user_id,
        post_id: comment.post_id
      }
    end
  end
  
end