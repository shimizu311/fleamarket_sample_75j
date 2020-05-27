class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
  end

  def create
    # binding.pry
    item = Item.create(item_params)
    if item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
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
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, images_attributes: {image_url: []}, brand_attributes: [:id, :name]).merge(seller_id: current_user.id)
  end
end
