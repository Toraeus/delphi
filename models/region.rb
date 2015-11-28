class Region
  include DataMapper::Resource

  property :id,   String,  key: true
  property :name, String
end
