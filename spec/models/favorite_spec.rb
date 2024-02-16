require 'rails_helper'

RSpec.describe Favorite, type: :model do
    context '正常系' do
        it '全てのフィールドが正常な場合、有効であること' do
            favorite = build(:favorite)
            expect(favorite).to be_valid
        end
    end

    context '異常系' do
        it 'ユーザーと掲示板の組み合わせがユニークでない場合,無効であること' do
            favorite = create(:favorite)
            new_favorite = build(:favorite, user: favorite.user, diagnosis: favorite.diagnosis)
            new_favorite.valid?
            expect(new_favorite.errors[:user_id]).to include('はすでに存在します'), 'favoriteとuserのユニークバリデーションが設定されていません'
        end
    end
end
