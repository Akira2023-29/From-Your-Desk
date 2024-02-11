# frozen_string_literal: true

module ApplicationHelper
    def page_title(title = '')
        base_title = 'デスク色彩診断'
        title.present? ? "#{title} | #{base_title}" : base_title
    end

    def default_meta_tags
        {
            site: 'Desk From Cokor',
            title: 'デスク環境診断サービス',
            reverse: 'true',
            charset: 'utf-8',
            description: 'デスク環境を色彩の観点から診断し、作業効率を上げるためのアドバイスを提案します。',
            keywords: '診断,デスク,色彩,作業生産性',
            canonical: request.original_url,
            separator: '|',
            og: {
                site_name: :site,
                title: :title,
                description: :description,
                type: 'website',
                url: request.original_url,
                image: image_url('OGP_x.png'), # 配置するパスやファイル名によって変更すること
                local: 'ja-JP'
            },
            # X(twitter)用の設定
            twitter: {
                card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
                # site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
                image: image_url('OGP_x.png') # 配置するパスやファイル名によって変更すること
            }
        }
    end

    def flash_class(message_type)
        case message_type.to_sym
        when :success
        'text-sky-600'
        when :danger
        'text-red-500'
        else
        'text-gray-500'
        end
    end

    def button_color(color_name)
        case color_name.to_s
        when "赤 (Red)"
        'bg-red-500'
        when "青 (Blue)"
        'bg-blue-500'
        when "黄色 (Yellow)"
        'bg-yellow-400'
        when "緑 (Green)"
        'bg-green-400'
        when "オレンジ (Orange)"
        'bg-orange-400'
        when "紫 (Purple)"
        'bg-purple-400'
        when "ピンク (Pink)"
        'bg-pink-400'
        when "茶色 (Brown)"
        'bg-amber-700'
        when "灰色 (Gray)"
        'bg-gray-400'
        when  "黒 (Black)"
        'bg-black text-white'
        when "白 (White)"
        'bg-white'
        when "金色 (Gold)"
        'bg-amber-300'
        when "銀色 (Silver)"
        'bg-gray-300'
        when "水色 (Aqua)"
        'bg-blue-300'
        when  "マゼンダ (Magenta)"
        'bg-pink-500'
        when  "ネイビー (Navy)"
        'bg-blue-800 text-white'
        when  "ライム (Lime)"
        'bg-lime-400'
        when  "ベージュ (Beige)"
        'bg-beige'
        else
        'bg-gray-500'
        end
    end
end
