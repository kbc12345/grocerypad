class Grocery < ActiveRecord::Base
  has_many :grocery_items

  INDEX_DETAILS = "
    product_categories.name as product_category_name,
    product_categories.id as product_category_id,
    grocery_items.id as grocery_item_id,
    products.name as product_name,
    grocery_items.quantity,
    products.price,
    products.status,
    products.id as product_id
  "


  def self.index_details grocery_id
    select(INDEX_DETAILS).from("products inner join grocery_items on products.id = grocery_items.product_id inner join product_categories on product_categories.id = products.product_category_id").where("grocery_items.grocery_id = #{grocery_id}")
  end

end