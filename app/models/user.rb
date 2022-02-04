class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :reservations
  has_many :room_users
  has_many :messages
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  with_options presence: true do
    validates :nickname, format: { with: /\A[ぁ-ゔァ-ヴー－\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width character.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width character.' }
    validates :phonenumber, format: { with: /\A[0-9]{10,11}\z/, message: 'Input only number.' }
  end
end
