require 'active_support'

module NetHttpModule
  extend ActiveSupport::Concern

  require 'net/http'

  # def api_get(set_URL)
  #   uri = URI.parse(set_URL)
  #   http = Net::HTTP.new(uri.host, uri.port)

  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   request = Net::HTTP::Get.new(uri)
  #   # request = Net::HTTP::Get.new(uri.path)

  #   response = http.request(request)
  # end

  def api_get(set_URL)
    uri = URI.parse(set_URL)
    response = Net::HTTP.get_response(uri)
  end

  def api_post(set_URL, body)
    uri = URI.parse(set_URL)
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data(body)

    response = http.request(request)
  end

  private


end
