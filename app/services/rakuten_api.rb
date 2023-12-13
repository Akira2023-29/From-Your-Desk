class RakutenApi
    def self.color_name(analysis_color_info)
        first_color_info = analysis_color_info.first            # 配列の先頭の色彩情報を取得
        rgb_values = first_color_info.split(':').first   # RGB値を取得
        rgb_array = rgb_values.split(',').map(&:to_i)   # RGB値を配列に変換
        
        red, green, blue = rgb_array  # RGB値をred, green, blue に格納

        # 色名判定ロジック
        if red > 200 && green < 50 && blue < 50
            'Red'
        elsif red < 50 && green < 50 && blue > 200
            'Blue'
        elsif red < 50 && green > 200 && blue < 50
            'Green'
        elsif red > 200 && green > 200 && blue < 50
            'Yellow'
        elsif red > 200 && green < 150 && blue > 150
            'Pink'
        elsif red > 100 && green < 100 && blue > 200
            'Purple'
        elsif red > 200 && green > 100 && blue < 50
            'Orange'
        elsif red > 100 && green > 50 && green < 100 && blue < 50
            'Brown'
        elsif red < 50 && green < 50 && blue < 50
            'Black'
        elsif red > 200 && green > 200 && blue > 200
            'White'
        elsif red >= 150 && green >= 150 && blue >= 150
            'Gray'
        elsif red >= 150 && green >= 150 && blue < 100
            'Beige'
        else
            colors = ['Red', 'Blue', 'Green', 'Yellow', 'Pink', 'Purple', 'Orange', 'Brown', 'Black', 'White']
            colors.sample
        end
    end
end