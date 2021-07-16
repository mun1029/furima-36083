class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    if current_user.id != @product.user.id && @product.order == nil
      @order_sipping = OrderSipping.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_sipping = OrderSipping.new(order_params)
    if @order_sipping.valid?
      pry_product
      @order_sipping.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private

  def order_params
    params.require(:order_sipping).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  def pry_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
