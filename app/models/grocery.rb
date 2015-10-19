class Grocery < ActiveRecord::Base
  has_many :grocery_items

  INDEX_DETAILS = "
    grocery_items.id,
    products.name as product_name,
    grocery_items.quantity,
    products.price,
    (grocery_items.quantity*products.price) as total,
    products.status as product_status,
    products.id as product_id,
    product_categories.name as product_category_name,
    product_categories.id as product_category_id
  "

  def grocery_items_full_details
    GroceryItem.select(INDEX_DETAILS).
    from("products inner join grocery_items on products.id = grocery_items.product_id inner join product_categories on product_categories.id = products.product_category_id").
    where("grocery_items.grocery_id = ?", self.id)
  end

end
