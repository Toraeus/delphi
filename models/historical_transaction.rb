class HistoricalTransaction
  include DataMapper::Resource

  property :id,            Serial

  property :low_price,     Integer
  property :average_price, Integer
  property :high_price,    Integer

  property :volume,        Integer
  property :order_count,   Integer
  property :date,          DateTime

  belongs_to :item
  belongs_to :region
end
