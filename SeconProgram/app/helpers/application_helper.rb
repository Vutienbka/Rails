module ApplicationHelper
  #Tham số condition được truyền vào ở đây cho biết giỏ hàng có trống không.
  # Tham số attributes là một danh sách các tham số khác, ở trên chúng ta truyền vào là id có giá trị "cart".
  # Tham số &block là đoạn <%= render current_cart %>
  # Nếu condition là true, tức là giỏ hàng đúng là trống,
  # thì chúng ta định nghĩa thêm một phần tử trong thuộc tính attributes có khóa là style và giá trị là "display:none".
  # Cuối cùng chúng ta gọi phương thức content_tag(), hàm này nhận vào tên một thẻ,
  # danh sách các thuộc tính và giá trị của tham số đó,
  # và biến &block, hàm này sẽ bọc những gì trong &block với tên thẻ và thuộc tính
  def hide_cart_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div", attributes, &block)
    end
end
