class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    Item.create(item_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def buy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, :seller_id)
  end
end
