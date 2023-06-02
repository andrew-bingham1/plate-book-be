class UserSerializer
  include JSONAPI::Serializer
  attributes :id,
             :username,
             :email, 
             :uid,
             :token,
             :created_at,
             :updated_at

  has_many :posts
  has_many :plates, through: :user_plates

  attribute :comments do |user|
    user.comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        post_id: comment.post_id
      }
    end
  end

end