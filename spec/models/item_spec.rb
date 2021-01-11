require 'rails_helper'
describe Item do
  subject { item }
  shared_examples '登録できる' do
    it { is_expected.to be_valid }
  end
  shared_examples '登録できない' do
    it { is_expected.to be_invalid }
  end

  describe 'すべての項目' do
    context 'image、name、info、info、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、price、user_idが存在する時' do
      let(:item) { build(:item) }
      it_behaves_like '登録できる'
    end
  end
  describe 'imageの検証' do
    context '空の場合' do
      let(:item) { build(:itemImageCleared) }
      it_behaves_like '登録できない'
    end
  end
  describe 'nameの検証' do
    context '空の場合' do
      let(:item) { build(:item, name: nil) }
      it_behaves_like '登録できない'
    end
  end
  describe 'infoの検証' do
    context '空の場合' do
      let(:item) { build(:item, info: nil) }
      it_behaves_like '登録できない'
    end
  end
  describe 'category_idの検証' do
    context '選択されていない場合' do
      let(:item) { build(:item, category_id: 0) }
      it_behaves_like '登録できない'
    end
  end
  describe 'sales_status_idの検証' do
    context '選択されていない場合' do
      let(:item) { build(:item, sales_status_id: 0) }
      it_behaves_like '登録できない'
    end
  end
  describe 'shipping_fee_status_idの検証' do
    context '選択されていない場合' do
      let(:item) { build(:item, shipping_fee_status_id: 0) }
      it_behaves_like '登録できない'
    end
  end
  describe 'prefecture_idの検証' do
    context '選択されていない場合' do
      let(:item) { build(:item, prefecture_id: 0) }
      it_behaves_like '登録できない'
    end
  end
  describe 'scheduled_delivery_idの検証' do
    context '選択されていない場合' do
      let(:item) { build(:item, scheduled_delivery_id: 0) }
      it_behaves_like '登録できない'
    end
  end
  describe 'priceの検証' do
    context '300以上の場合' do
      let(:item) { build(:item, price: 300) }
      it_behaves_like '登録できる'
    end
    context '9999999以下の場合' do
      let(:item) { build(:item, price: 9_999_999) }
      it_behaves_like '登録できる'
    end
    context '299以下の場合' do
      let(:item) { build(:item, price: 299) }
      it_behaves_like '登録できない'
    end
    context '10000000以上の場合' do
      let(:item) { build(:item, price: 10_000_000) }
      it_behaves_like '登録できない'
    end
    context '半角数字以外の場合' do
      let(:item) { build(:item, price: 'okane') }
      it_behaves_like '登録できない'
    end
  end
  describe 'user_idの検証' do
    context '空の場合' do
      let(:item) { build(:item, user_id: nil) }
      it_behaves_like '登録できない'
    end
  end
end
