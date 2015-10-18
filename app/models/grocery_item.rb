class GroceryItem < ActiveRecord::Base
	belongs_to :grocery, class_name: "Grocery", foreign_key: "grocery_id"
	belongs_to :product, class_name: "Product", foreign_key: "product_id"
end