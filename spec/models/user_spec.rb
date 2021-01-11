require 'rails_helper'
describe User do
  subject{ user }
  shared_examples '登録できる' do
    it { is_expected.to be_valid }
  end
  shared_examples '登録できない' do
    it { is_expected.to be_invalid }
  end
  describe 'すべての項目' do
    context 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在する時' do
      let(:user){ build(:user) }
      it_behaves_like '登録できる'
    end
  end
  describe 'nicknameの検証' do
    context '空の場合' do
      let(:user){ build(:user, nickname: nil) }
      it_behaves_like '登録できない'
    end
  end
  describe 'emailの検証' do
    context '空の場合' do
      let(:user){ build(:user, email: nil) }
      it_behaves_like '登録できない'
    end
    context 'email形式でない場合' do
      let(:user){ build(:user, email: 'aaaaaaa') }
      it_behaves_like '登録できない'
    end
    context 'emailが重複している場合' do
      let!(:another_user){ create(:user, email: 'same@email') }
      let(:user){ build(:user, email: 'same@email') }
      it_behaves_like '登録できない'
    end
  end
  describe 'passwordの検証' do
    context '空の場合' do
      let(:user){ build(:user, password: nil, password_confirmation: nil) }
      it_behaves_like '登録できない'
    end
    context '6文字以上で英字と数字の両方がある場合' do
      let(:user){ build(:user, password: '123abc', password_confirmation: '123abc') }
      it_behaves_like '登録できる'
    end
    context '5文字以下の場合' do
      let(:user){ build(:user, password: '123ab', password_confirmation: '123ab') }
      it_behaves_like '登録できない'
    end
    context '数字だけの場合' do
      let(:user){ build(:user, password: '123456', password_confirmation: '123456') }
      it_behaves_like '登録できない'
    end
    context '英字だけの場合' do
      let(:user){ build(:user, password: 'abcdef', password_confirmation: 'abcdef') }
      it_behaves_like '登録できない'
    end
    context 'password_confirmationと不一致の場合' do
      let(:user){ build(:user, password: '123abc', password_confirmation: 'abc123') }
      it_behaves_like '登録できない'
    end
  end
  describe 'last_nameの検証' do
    context '（全角）の場合' do
      let(:user){ build(:user, last_name: 'アあ漢字') }
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:user){ build(:user, last_name: nil) }
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:user){ build(:user, last_name: 'aaa') }
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:user){ build(:user, last_name: '空 白') }
      it_behaves_like '登録できる'
    end
  end
  describe 'first_nameの検証' do
    context '（全角）の場合' do
      let(:user){ build(:user, first_name: 'アあ漢字') }
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:user){ build(:user, first_name: nil) }
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:user){ build(:user, first_name: 'aaa') }
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:user){ build(:user, first_name: '空 白') }
      it_behaves_like '登録できる'
    end
  end
  describe 'last_name_kanaの検証' do
    context '（全角）の場合' do
      let(:user){ build(:user, last_name_kana: 'アアア') }
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:user){ build(:user, last_name_kana: nil) }
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:user){ build(:user, last_name_kana: 'あああ') }
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:user){ build(:user, last_name_kana: 'クウ ハク') }
      it_behaves_like '登録できない'
    end
  end
  describe 'first_name_kanaの検証' do
    context '（全角）の場合' do
      let(:user){ build(:user, first_name_kana: 'アアア') }
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:user){ build(:user, first_name_kana: nil) }
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:user){ build(:user, first_name_kana: 'あああ') }
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:user){ build(:user, first_name_kana: 'クウ ハク') }
      it_behaves_like '登録できない'
    end
  end
  describe 'birth_dateの検証' do
    context '空の場合' do
      let(:user){ build(:user, birth_date: nil) }
      it_behaves_like '登録できない'
    end
  end
end
