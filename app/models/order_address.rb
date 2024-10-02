class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  # バリデーションの追加
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含めてください（例000-0000）' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は半角で10桁か11桁でハイフン含まず入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end

  # 購入情報と配送先住所情報を保存する処理
  def save
    # 購入情報を保存し、その購入情報のIDを取得
    order = Order.create(user_id: user_id, item_id: item_id)

    # 住所情報を保存し、購入情報と関連付ける
    Address.create(
      postal_code:, prefecture_id:, city:, block:, building:,
      phone_number:, order_id: order.id
    )
  end
end
