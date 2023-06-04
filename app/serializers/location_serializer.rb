class LocationSerializer
  include JSONAPI::Serializer
  attributes :lat, :lng

end