class CardsController < ApplicationController
  require 'payjp'
  before_action :set_api_key, except: :new

  def new
  end

  def create
    if params['payjp_token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(card: params['payjp_token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        render :create
      end
    end
  end

  def show
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      render :new
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card = customer.cards.retrieve(card.card_id)
      @card_number_display = "**** **** **** " + @default_card.last4
      @exp_month_display = @default_card.exp_month.to_s
      @exp_year_display = @default_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    if card.destroy
      redirect_to new_card_path
    else
      redirect_to card_path(current_user.id), alert: "削除できませんでした。"
    end
  end

  private

  def set_api_key
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  end
end
