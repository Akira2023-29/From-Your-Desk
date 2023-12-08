class DeeplApi
    def self.translate(text, target_lang)
        uri = URI('https://api-free.deepl.com/v2/translate')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri)

        # APIkeyを設定
        request['Authorization'] = "DeepL-Auth-Key #{ENV['DEEPLE_API_KEY']}"
        request.set_form_data(text: text, target_lang: target_lang)
        response = http.request(request)
        
        if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)['translations'].first['text']
        else
        nil # もしくはエラーハンドリング
        end
    end
end