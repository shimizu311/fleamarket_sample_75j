class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items =Item.limit(3).where(buyer_id: nil).order(created_at: :desc)
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
  end

  def edit
  end

  def update
    if @item.update(update_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  require "payjp"
  def confirm
    @item = Item.find(params[:id])
    if current_user.card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      @card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = customer.cards.retrieve(@card.card_id)
      @card_number_display = "**** **** **** " + @default_card.last4
      @exp_month_display = @default_card.exp_month.to_s
      @exp_year_display = @default_card.exp_year.to_s.slice(2,3)
    else
    end
  end

  def pay
    @item = Item.find(params[:id])
    if @item.buyer_id.present?
      redirect_to item_path(@item.id), alert: '売り切れています'
    else
      @item.with_lock do
        if current_user.card.present?
          @card = Card.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
          charge = Payjp::Charge.create(
            amount: @item.price,
            customer: Payjp::Customer.retrieve(@card.customer_id),
            currency: 'jpy'
          )
        else
          Payjp::Charge.create(
            amount: @item.price,
            card: params['payjp-token'],
            currency: 'jpy'
          )
        end
        if @item.update(buyer_id: current_user.id)
          redirect_to root_path
        else
          flash.now[:alert] = '購入に失敗しました'
          render :confirm
        end
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, images_attributes: [:image_url], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, images_attributes: [:image_url, :_destroy, :id], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end