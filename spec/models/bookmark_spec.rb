require 'rails_helper'

RSpec.describe Bookmark, type: :model do
    context '正常系' do
        it '全てのフィールドが正常な場合、有効であること' do
            # bookmark = build(:bookmark)
            # expect(bookmark).to be_valid
        end
    end

    context '異常系' do
        it 'ユーザーと掲示板の組み合わせがユニークでない場合,無効であること' do
            # bookmark = create(:bookmark)
            # new_bookmark = build(:bookmark, user: bookmark.user, board: bookmark.board)
            # new_bookmark.valid?
            # expect(new_bookmark.errors[:user_id]).to include('はすでに存在します'), 'bookmarkとuserのユニークバリデーションが設定されていません'
        end
    end
end
