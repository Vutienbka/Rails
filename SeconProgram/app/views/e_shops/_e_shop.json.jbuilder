json.extract! e_shop, :id, :productImage, :productName, :quantity, :price, :description, :created_at, :updated_at
json.url e_shop_url(e_shop, format: :json)
