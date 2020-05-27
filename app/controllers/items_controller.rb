class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      params[:images][:image_url].each do |i|
        @item.images.create(image_url: i, item_id: @item.id)
      end
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @item   = Item.find(params[:id])
    # @image  = Item.includes([:images])
    # @user   = User.find(params[:id])
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
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, images_attributes: [:image_url], brand_attributes: [:id, :name]).merge(seller_id: current_user.id)
  end
end
