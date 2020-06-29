class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = current_cart
    if @cart.items.empty?
      redirect_to products_path, notice: 'Your cart is empty'
      return
    end
    @order = Order.new
    # @items = current_cart.items
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.add_items_from_current_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to @order, notice: 'Order was successfully created.'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }

      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(product_params)
        format.html { redirect_to @order, notice: 'Product was updated successful' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :'products/edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.destroy
        format.html { redirect_to products_path, notice: 'Order was successfully destroyed.' }
      else
        format.html { redirect_to products_path, notice: 'Order was not successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:buyerName, :address, :email, :pay_type, :items)
  end
end
