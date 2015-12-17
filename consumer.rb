require 'net/http'
require 'openssl'
require 'uri'
require 'json'

class Consumer
  def initialize(url)
    @uri = URI.parse(url)
  end

  def run
    response = send_request(@uri)

    collate_pages(response.body)
  end

  private

  def collate_pages(body)
    data = JSON.parse(body)

    items = data["items"]

    loop do
      break unless data["next"]

      response = send_request( URI.parse( data["next"]["href"] ) )
      data = JSON.parse(response.body)
      items += data["items"]
    end

    items
  end

  def send_request(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)

    if response.code == "200"
      response
    else
      raise "ERROR: #{response.code}"
    end
  end
end
