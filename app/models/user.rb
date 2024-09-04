# app/models/user.rb
class User < ApplicationRecord
  # Deviseのモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パス,バリデーション定義
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :nickname, presence: true

  # メアド、@含有
  validates :email, presence: true, uniqueness: true,
                    format: { with: /@/, message: 'は@を含む必要があります' }

  # パス必須6字以上、半角英数字混合
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

validates :password_confirmation, presence: { message: 'を入力してください' }

  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }

  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }

  validates :birth_date, presence: true
end
