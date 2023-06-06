class UserPlateSerializer
  include JSONAPI::Serializer
  attributes :id, :plate_id, :user_id
end