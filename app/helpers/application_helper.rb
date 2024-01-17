# frozen_string_literal: true

module ApplicationHelper

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
                image: image_url('OGP.jpg'), # 配置するパスやファイル名によって変更すること
                local: 'ja-JP'
            },
            # X(twitter)用の設定
            twitter: {
                card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
                # site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
                image: image_url('OGP.jpg') # 配置するパスやファイル名によって変更すること
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
end
