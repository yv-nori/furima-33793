class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname 
    validates :last_name,       format: {with: VALID_NAME_REGEX}
    validates :first_name,      format: {with: VALID_NAME_REGEX}
    validates :last_name_kana,  format: {with: VALID_KANA_REGEX}
    validates :first_name_kana, format: {with: VALID_KANA_REGEX}
    validates :birth_date 
    validates :password,        format: {with: VALID_PASSWORD_REGEX}
  end
  has_many :items,  dependent: :destroy
  has_many :orders, dependent: :destroy
end
