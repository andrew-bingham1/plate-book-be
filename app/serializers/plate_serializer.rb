class PlateSerializer
  include JSONAPI::Serializer
  attributes :plate_number,
             :created_at,
             :updated_at

end