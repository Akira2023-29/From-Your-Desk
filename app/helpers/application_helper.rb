# frozen_string_literal: true

module ApplicationHelper

    def default_meta_tags
        {
            site: 'Desk From Cokor',
            title: 'デスク環境診断サービス',
            reverse: 'true',
            charset: 'utf-8',
            description: 'デスク環境を色彩の観点から診断し、作業効率を上げるためのアドバイスを提案します。',
            
        }
    end
end
