class ItemsController < ApplicationController
  # ログインしているユーザーのみアクセス可能にする（オプション）
  before_action :authenticate_user!, only: [:new, :create]


  def index
    # アクションの内容
  end

  # 出品ページを表示するアクション
  def new
    @item = Item.new  # 新しいItemオブジェクトを作成
  end

  # 商品情報を保存するアクション（出品のため）
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      render :new  # バリデーションエラーの場合、出品ページを再表示
    end
  end

  private

  # Strong Parametersで安全にパラメータを受け取る
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price, :image)
  end

end