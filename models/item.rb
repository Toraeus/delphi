class Item
  include DataMapper::Resource

  property :id, Serial

  #def self.import_from_json(json)
    #json.each do |record|
      #HistoricalTransaction.create(record)
    #end
  #end
end
