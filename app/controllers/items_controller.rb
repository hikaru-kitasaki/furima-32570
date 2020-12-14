class ItemsController < ApplicationController
  before_action :authenticate_user!, 　except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    if current_user.id == @item.user_id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :selling_price, :category_id, :status_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
