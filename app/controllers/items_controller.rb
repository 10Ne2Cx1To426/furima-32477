class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :before_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_action, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show  
  end

  def edit  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def before_item
    @item = Item.find(params[:id])
  end

  def redirect_action
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
