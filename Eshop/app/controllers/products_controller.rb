class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

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
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }

      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
    # respond to la minh se phan hoi ket qua ve dau
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was updated successful' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :'products/edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:productImage, :productName, :quantity, :price, :description, :manufaturer)
  end

end
