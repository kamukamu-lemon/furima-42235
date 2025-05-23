class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nick_name, :birth_date, :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :last_name, :first_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters'
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :last_name_kana, :first_name_kana, with: NAME_KANA_REGEX,
                                                         message: 'is invalid. Input full-width katakana characters'

  validates_format_of :password, with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,
                                 message: 'is invalid. Include both letters and numbers'
end
