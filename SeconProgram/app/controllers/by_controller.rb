class ByController < ApplicationController

  def product
    @product = Item.find(params[:id])
  end

end

