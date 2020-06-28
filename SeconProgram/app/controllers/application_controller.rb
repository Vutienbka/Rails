class ApplicationController < ActionController::Base
  # Mỗi khi có người dùng nào truy cập vào website thì sẽ tạo một đối tượng cart rồi lưu vào CSDL

  def current_cart
    # Kiem tra va duy tri phien lam viec hien tai voi cart tuong ung thong qua cart_id
    Cart.find(session[:cart_id])
      # Neu khong se tao mot cart moi ung voi session hien tai
      # Va tao ra cart moi voi cartId moi
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  # Chúng ta có thể gọi đến phương thức này trong file View khac nhau ma khong bi loi
  helper_method :current_cart
end
