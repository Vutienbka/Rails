class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end


  def create
    @cart = current_cart
    # Lay id tren duong dan thong qua params[:id]
    product = Product.find(params[:id])
    @item = @cart.add_product(product.id)

    respond_to do |format|
      if @item.save
        # @item.cart
        format.html { redirect_to @item.cart, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:product_id, :cart_id)
  end

end
