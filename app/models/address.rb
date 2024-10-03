class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :prefecture

  # バリデーション
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' } # 郵便番号のバリデーション（ハイフンを含む）
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } # 都道府県が未選択でないことのバリデーション（ActiveHashを使う場合）
  validates :city, :block, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' } # 電話番号のバリデーション（10桁または11桁）
end
