class PostSerializer
  include JSONAPI::Serializer
  attributes :id,
             :title,
             :body,
             :user_id,
             :created_at,
             :updated_at
end