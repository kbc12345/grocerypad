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
    from("products, grocery_items, product_categories").
    where("products.id = grocery_items.product_id").
    where("products.product_category_id = product_categories.id").
    where("grocery_items.grocery_id = ?", self.id)
  end

  def self.is_latest? details
    flag = false
    last_grocery = Grocery.latest_grocery
    if details[:year].to_i >= last_grocery.year.to_i && details[:month].to_i >= last_grocery.month.to_i
        flag = true
    end
    flag
  end

  def self.latest_grocery
    order(year: "desc", month: "desc", half: "desc").first
  end

end
