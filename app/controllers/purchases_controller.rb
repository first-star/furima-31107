class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:index, :create]


  def index
    if @item.purchase.present? || (current_user.id == @item.user.id)
      redirect_to root_path
    else
      @purchase_form = PurchaseForm.new
    end
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_params
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:post_code, :city, :prefecture_id, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
