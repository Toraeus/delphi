class Fixtures
  def self.load
    begin
      Region.create(name: "The Forge",    id: "10000002")
      Region.create(name: "Domain",       id: "10000043")
      Region.create(name: "Sinq Liaison", id: "10000032")
      Region.create(name: "Heimatar",     id: "10000030")
      Region.create(name: "Metropolis",   id: "10000042")
    rescue
      puts "Failed to create regions"
    end
  end
end

