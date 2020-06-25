class StoreController < ApplicationController
  def index
    @e_shops = EShop.all
    @cart = current_cart
  end
end
