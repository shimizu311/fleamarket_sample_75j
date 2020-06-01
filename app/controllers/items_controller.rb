class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def show
    @item   = Item.find(params[:id])
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
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, images_attributes: [:image_url], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
end
