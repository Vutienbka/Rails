class ProductsController < ApplicationController
  # Set=product se tu dong chay cau lenh @product = Product.find(params[:id]) truoc
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  PRODUCT_PER_PAGE = 3

  def index
    # @product = Product.all
    # @page = params.fetch(:page, 0).to_i
    # @product = Product.offset(@page * PRODUCT_PER_PAGE).limit(PRODUCT_PER_PAGE)
    #
    #
    # @pagy, @product = pagy(Product.all)
    # @pagy, @product = pagy(Product.where(["productName LIKE?", "%#{params[:search]}%"]))
    @pagy, @product = pagy(Product.search(params[:search]))
    # @pagy, @product = pagy(Product.all, items: 3)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
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

  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      else
        format.html { redirect_to products_path, notice: 'Product was not successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:productImage, :productName, :quantity, :price, :description, :manufacturer)
  end

end
