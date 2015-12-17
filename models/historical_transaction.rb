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

  validates_uniqueness_of :date

  def self.import_from_json(json)
    json.each do |data|
      self.create(
        :low_price     => data[ "lowPrice"   ] * 100,
        :average_price => data[ "avgPrice"   ] * 100,
        :high_price    => data[ "highPrice"  ] * 100,
        :volume        => data[ "volume"     ],
        :order_count   => data[ "orderCount" ],
        :date          => data[ "date"       ]
      )
    end
  end
end
