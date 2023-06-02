class UserSerializer
  include JSONAPI::Serializer
  attributes :id,
             :username,
             :email, 
             :uid,
             :token,
             :created_at,
             :updated_at
end