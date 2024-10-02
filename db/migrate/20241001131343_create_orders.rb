class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true  # ユーザー外部キー
      t.references :item, null: false, foreign_key: true  # 商品外部キー

      t.timestamps
    end
  end
end
