class UserSerializer
  include JSONAPI::Serializer
  attributes :id,
             :username,
             :email, 
             :uid,
             :token,
             :created_at,
             :updated_at

  attribute :comments do |user|
    user.comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        post_id: comment.post_id
      }
    end
  end

  attribute :posts do |user|
    user.posts.map do |post|
      {
        id: post.id,
        title: post.title
      }
    end
  end

  attribute :plates do |user|
    user.plates.map do |plate|
      {
        id: plate.id,
        plate_number: plate.plate_number
      }
    end
  end

end