class Item
  include DataMapper::Resource

  property :id,   String, key: true
  property :name, String

  #def self.import_from_json(json)
    #json.each do |record|
      #HistoricalTransaction.create(record)
    #end
  #end

  def effVol

  end

  def profit

  end

  def competition

  end
end
