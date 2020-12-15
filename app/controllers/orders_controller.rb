class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_action
  before_action :order_redirect

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_action
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def order_redirect
    if @item.order.present?
      redirect_to root_path
    end
  end
end
