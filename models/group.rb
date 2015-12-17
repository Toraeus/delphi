class Group
  def initialize(url)
    @consumer = Consumer.new(url)
  end

  def get_all_items
    items = []

    loop do
      data = @consumer.run
      items += data["items"]
      break unless data["next"]
      @consumer = Consumer.new(data["next"]["href"])
    end
    items
  end
end
