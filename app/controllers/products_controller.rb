class ProductsController < ApplicationController
  before_action :admin_authorize, except: [:show, :index]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      flash[:notice] = "Oops. Try again. You missed something."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:notice] = "Oops. Try again. You missed something."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Your product has been deleted"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :origin, :date_caught, :image, :description)
  end
end
