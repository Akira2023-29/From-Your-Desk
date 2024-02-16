class GoogleCloudVisionApi
  def self.analyze_image(uploaded_image_path)
    api_key = ENV['GOOGLE_API_KEY']
    # Google Cloud Vision APIのエンドポイントを構築。
    uri = URI("https://vision.googleapis.com/v1/images:annotate?key=#{api_key}")
    # 渡された画像データをBase64にエンコードしてAPIに送れる形にする。
    image_data = Base64.strict_encode64(File.open(uploaded_image_path, 'rb').read)

    body = {
      requests: [{
        image: {
          content: image_data
        },
        features: [
          { type: 'IMAGE_PROPERTIES', maxResults: 10 },
          { type: 'LABEL_DETECTION', maxResults: 10 }
        ]
      }]
    }.to_json

    # HTTPオブジェクトを使ってHTTPリクエストを作成。
    # POSTメソッド+ヘッダーに'Content-Type' => 'application/json'を指定。
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, { 'Content-Type' => 'application/json' })
    request.body = body

    # リクエストを送信→レスポンス受け取り。
    response = http.request(request)

    # レスポンスのHTTPステータスコードが200の場合、レスポンスボディから色情報を抽出。
    if response.code == '200'
      label_data = JSON.parse(response.body)['responses'][0]['labelAnnotations']
      # ラベル情報から条件を満たすものを検索
      desk_or_table_with_high_score = label_data.any? do |label_info|
        # ラベルの記述が'desk'または'table'で（大文字も含む）、かつスコアが90以上であるかどうかを確認
        %w[desk table].include?(label_info['description'].downcase) &&
          (label_info['score'] * 100).round(3) >= 90
      end
      return false unless desk_or_table_with_high_score

      if desk_or_table_with_high_score
        color_full_data = JSON.parse(response.body)['responses'][0]['imagePropertiesAnnotation']['dominantColors']['colors']
        # 色の画面支配率（pixelFraction）で降順にソート
        sorted_by_pixel_fraction = color_full_data.sort_by { |color_info| -color_info['pixelFraction'] }
        # 文字数削減のため、必要な数値部分のみ抽出。
        sorted_by_pixel_fraction.map do |color_info|
          color = color_info['color'].values.join(', ').split(', ').map(&:to_i).join(', ') # RGB値の値を抽出。
          score = (color_info['score'] * 100).round(3) # 各色の支配率スコアを抽出。
          pixel_fraction = (color_info['pixelFraction'] * 100).round(3) # 各色の画像内のどれくらいの割合のピクセルを占めているかを抽出。
          "#{color}: #{score} :#{pixel_fraction}"
        end
      end
    else
      false
    end
  end
end
