class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # Khi click vao nut button "Add to cart"
    # Truoc tien se kiem tra trong phien lam viec hien tai co cart tuong ung hay khong
    # Neu co se gan doi tuong hien tai cho bien @cart
    # neu khong se sinh ra mot cart moi roi gan vao bien @cart
    @cart = current_cart
    # Tiep theo tim product ung voi id tuong ung duoc truyen vao thong qua duong dan cua item
    # <%= button_to 'Add to Cart', items_path(:id => e_shop)
    # :id cua e_shop hien tai se gan vao id cua item va truyen id nay vao duong dan cua item
    product = EShop.find(params[:id])
    # Add vao itemList trong cart
    # @item = @cart.items.build(e_shop: product)
    # Save vao CSDL item

    @item = @cart.add_product(product.id)

    respond_to do |format|
      if @item.save
        # @item.cart
        format.html { redirect_to '/', notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:e_shop_id, :cart_id)
    end
end
