class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_edit,  only: [:edit, :update]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
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
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :delivery_id, :area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_edit
    unless current_user.id == @product.user.id
      redirect_to action: :index
    end
  end
end
