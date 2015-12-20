class ItemListImporter
  GROUPS = [
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/4/", # Ships
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/9/", # Ship Equipment
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/11/", # Ammo
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/19/", # Trade Goods
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/24/", # Implants
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/157/", # Drones
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/475/", # Research
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/1396/", # Clothing
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/1922/", # Pilot Services
    "https://public-crest.eveonline.com/market/types/?group=https://public-crest.eveonline.com/market/groups/1954/" # Ship Skins
  ]

  def self.import!
    GROUPS.each do |url|
      ItemListImporter.new(url).get_all_items
    end
  end

  def initialize(url)
    @consumer = Consumer.new(url)
  end

  def get_all_items
    json = @consumer.run

    json.each do |item|
      item_id   = item["type"]["id"  ]
      item_name = item["type"]["name"]

      puts "DEBUG: importing #{item_name}"
      Item.create(id: item_id, name: item_name) rescue nil
    end
  end
end
