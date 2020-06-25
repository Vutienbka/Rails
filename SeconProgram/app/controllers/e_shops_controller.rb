class EShopsController < ApplicationController
  before_action :set_e_shop, only: [:show, :edit, :update, :destroy]

  # GET /e_shops
  # GET /e_shops.json
  def index
    @e_shops = EShop.all
    # @e_shops_hot = EShop.limit(5).order()
    # @e_shops = EShop.order('id desc').limit(3)
  end

  # GET /e_shops/1
  # GET /e_shops/1.json
  def show
  end

  # GET /e_shops/new
  def new
    @e_shop = EShop.new
  end

  # GET /e_shops/1/edit
  def edit
  end

  # POST /e_shops
  # POST /e_shops.json
  def create
    @e_shop = EShop.new(e_shop_params)

    respond_to do |format|
      if @e_shop.save
        format.html { redirect_to @e_shop, notice: 'E shop was successfully created.' }
        format.json { render :show, status: :created, location: @e_shop }
      else
        format.html { render :new }
        format.json { render json: @e_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /e_shops/1
  # PATCH/PUT /e_shops/1.json
  def update
    respond_to do |format|
      if @e_shop.update(e_shop_params)
        format.html { redirect_to @e_shop, notice: 'E shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @e_shop }
      else
        format.html { render :edit }
        format.json { render json: @e_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /e_shops/1
  # DELETE /e_shops/1.json
  def destroy
    @e_shop.destroy
    respond_to do |format|
      format.html { redirect_to e_shops_url, notice: 'E shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_e_shop
      @e_shop = EShop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def e_shop_params
      params.require(:e_shop).permit(:productImage, :productName, :quantity, :price, :description)
    end
end
