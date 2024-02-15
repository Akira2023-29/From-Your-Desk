require 'rails_helper'

RSpec.describe Item, type: :model do
    let(:item) { create :item }

    context '正常系' do
        it 'すべてのフィールドが正常の場合、有効であること' do
            expect(item).to be_valid
        end
    end

    context '異常系' do
        it '題名が未入力の場合、無効であること' do
            item.title = nil
            expect(item).to be_invalid
            expect(item.errors[:title]).to include('を入力してください')
        end

        it '題名の内容が51文字以上の場合、無効であること' do
            item.title = 'a' * 51
            expect(item).to be_invalid
            expect(item.errors[:title]).to include('は50文字以内で入力してください')
        end

        it '本文が未入力の場合、無効であること' do
            item.body = nil
            expect(item).to be_invalid
            expect(item.errors[:body]).to include('を入力してください')
        end

        it '本文の内容が256文字以上の場合、無効であること' do
            item.body = 'a' * 256
            expect(item).to be_invalid
            expect(item.errors[:body]).to include('は255文字以内で入力してください')
        end

        # it 'カテゴリーが未選択の場合、無効であること' do
        #     item = build(:item, item_category_id: nil)
        #     expect(item).to be_invalid
        #     expect(item.errors[:item_category_id]).to include('を入力してください')
        # end

        it '色分類が未選択の場合、無効であること' do
            item.colors = []
            expect(item).to be_invalid
            expect(item.errors[:color_ids]).to include('を入力してください')
        end

        it '色分類を４種類以上選択した場合、無効であること' do
            item.colors = FactoryBot.create_list(:color, 4)
            item.validate_color_selection
            expect(item).to be_invalid
            expect(item.errors[:color_ids]).to include('は3つまでしか選択できません。')
        end
    end
end
