require 'rails_helper'
describe User do
  let(:fakeUser)              {build(:user)}

  let(:email)                 {fakeUser.email}
  let(:password)              {fakeUser.password}
  let(:password_confirmation) {fakeUser.password}
  let(:nickname)              {fakeUser.nickname}
  let(:last_name)             {fakeUser.last_name}
  let(:first_name)            {fakeUser.first_name}
  let(:last_name_kana)        {fakeUser.last_name_kana}
  let(:first_name_kana)       {fakeUser.first_name_kana}
  let(:birth_date)            {fakeUser.birth_date}

  let(:user){User.new(
    nickname: nickname,
    email: email,
    password: password, 
    password_confirmation: password_confirmation,
    first_name: first_name,
    last_name: last_name,
    first_name_kana: first_name_kana,
    last_name_kana: last_name_kana,
    birth_date: birth_date
  )}

  subject{user}
  shared_examples '登録できる' do
    it { is_expected.to be_valid }
  end
  shared_examples '登録できない' do
    it { is_expected.to be_invalid }
  end
  describe 'すべての項目' do
    context 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在する時' do
      it_behaves_like '登録できる'
    end
  end
  describe 'nicknameの検証' do
    context '空の場合' do
      let(:nickname){nil}
      it_behaves_like '登録できない'
    end
  end
  describe 'emailの検証' do
    context '空の場合' do
      let(:email){nil}
      it_behaves_like '登録できない'
    end
    context 'email形式でない場合' do
      let(:email){'aaaaaaaa'}
      it_behaves_like '登録できない'
    end
    context 'emailが重複している場合' do
      let(:email){'same@email'}
      let!(:another_user){User.create(
        nickname: nickname,
        email: email,
        password: password, 
        password_confirmation: password_confirmation,
        first_name: first_name,
        last_name: last_name,
        first_name_kana: first_name_kana,
        last_name_kana: last_name_kana,
        birth_date: birth_date
      )}
      it_behaves_like '登録できない'
    end
  end
  describe 'passwordの検証' do
    context '空の場合' do
      let(:password){nil}
      let(:password_confirmation){password}
      it_behaves_like '登録できない'
    end
    context '6文字以上で英字と数字の両方がある場合' do
      let(:password){'123abc'}
      let(:password_confirmation){password}
      it_behaves_like '登録できる'
    end
    context '5文字以下の場合' do
      let(:password){'123ab'}
      let(:password_confirmation){password}
      it_behaves_like '登録できない'
    end
    context '5文字以下の場合' do
      let(:password){'123ab'}
      let(:password_confirmation){password}
      it_behaves_like '登録できない'
    end
    context '数字だけの場合' do
      let(:password){'123456'}
      let(:password_confirmation){password}
      it_behaves_like '登録できない'
    end
    context '英字だけの場合' do
      let(:password){'abcdef'}
      let(:password_confirmation){password}
      it_behaves_like '登録できない'
    end
    context 'password_confirmationと不一致の場合' do
      let(:password){'abc123'}
      let(:password_confirmation){'abc1234'}
      it_behaves_like '登録できない'
    end
  end
  describe 'last_nameの検証' do
    context '（全角）の場合' do
      let(:last_name){'アあ漢字'}
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:last_name){nil}
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:last_name){'aaa'}
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:last_name){'空 白'}
      it_behaves_like '登録できる'
    end
  end
  describe 'first_nameの検証' do
    context '（全角）の場合' do
      let(:first_name){'アあ漢字'}
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:first_name){nil}
      it_behaves_like '登録できない'
    end
    context '（全角）じゃない場合' do
      let(:first_name){'aaa'}
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:first_name){'空 白'}
      it_behaves_like '登録できる'
    end
  end
  describe 'last_name_kanaの検証' do
    context 'カナ（全角）の場合' do
      let(:last_name_kana){'アアア'}
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:last_name_kana){nil}
      it_behaves_like '登録できない'
    end
    context 'カナ（全角）じゃない場合' do
      let(:last_name_kana){'あああ'}
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:last_name_kana){'クウ ハク'}
      it_behaves_like '登録できない'
    end
  end
  describe 'first_name_kanaの検証' do
    context 'カナ（全角）の場合' do
      let(:first_name_kana){'アアア'}
      it_behaves_like '登録できる'
    end
    context '空の場合' do
      let(:first_name_kana){nil}
      it_behaves_like '登録できない'
    end
    context 'カナ（全角）じゃない場合' do
      let(:first_name_kana){'あああ'}
      it_behaves_like '登録できない'
    end
    context '空白が含まれる場合' do
      let(:first_name_kana){'クウ ハク'}
      it_behaves_like '登録できない'
    end
  end
  describe 'birth_dateの検証' do
    context '空の場合' do
      let(:birth_date){nil}
      it_behaves_like '登録できない'
    end
  end
end
