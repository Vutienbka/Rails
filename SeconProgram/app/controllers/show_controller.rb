class ShowController < ApplicationController
  def productList
    @productList = EShop.all
  end
end
