class Grocery < ActiveRecord::Base

  has_many :grocery_items

  INDEX_DETAILS = "
    items.grocery_item_id as id,
    items.name as product_name,
    items.quantity,
    items.price,
    (items.quantity*items.price) as total,
    items.status as product_status,
    items.product_id as product_id,
    product_categories.name as product_category_name,
    product_categories.id as product_category_id
  "

  ITEM_DETAILS = "
    grocery_items.id as grocery_item_id,
    products.name,
    grocery_items.quantity,
    products.price,
    products.status,
    grocery_items.product_id,
    grocery_items.grocery_id,
    products.product_category_id
  "

  def grocery_items_full_details
    # x = sanitize_sql_array(["(select * 
    # from products INNER JOIN grocery_items on grocery_items.product_id = products.id where grocery_items.grocery_id = ?) as items", self.id])

    GroceryItem.select(INDEX_DETAILS).
    from("product_categories LEFT JOIN (select "+Grocery::ITEM_DETAILS+" from products INNER JOIN grocery_items on grocery_items.product_id = products.id where grocery_items.grocery_id = "+self.id.to_s+") as items on items.product_category_id = product_categories.id")
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
