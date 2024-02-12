class DeeplApi
  def self.translate(text, target_lang)
    uri = URI('https://api-free.deepl.com/v2/translate')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri)

    # APIkeyを設定
    request['Authorization'] = "DeepL-Auth-Key #{ENV['DEEPLE_API_KEY']}"
    request.set_form_data(text:, target_lang:)
    response = http.request(request)

    JSON.parse(response.body)['translations'].first['text'] if response.is_a?(Net::HTTPSuccess)
  end
end
