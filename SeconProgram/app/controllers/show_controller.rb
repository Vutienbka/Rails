class ShowController < ApplicationController
  def productList
    @product = EShop.all
  end
end
