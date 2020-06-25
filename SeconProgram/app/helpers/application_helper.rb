module ApplicationHelper
  #Tham số condition được truyền vào ở đây cho biết giỏ hàng có trống không.
  # Tham số attributes là một danh sách các tham số khác, ở trên chúng ta truyền vào là id có giá trị "cart".
  # Tham số &block là đoạn <%= render current_cart %>
  def hide_cart_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display:none"
    end
    content_tag("div", attributes, &block)
    end
end
