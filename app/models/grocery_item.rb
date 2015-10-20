class GroceryItem < ActiveRecord::Base
	belongs_to :grocery
	# no need to specify
	# belongs_to :grocery, class_name: "Grocery", foreign_key: "grocery_id"
	belongs_to :product, class_name: "Product", foreign_key: "product_id"

  validate :product_uniqueness

	private

	def product_uniqueness
		existing_entry = GroceryItem.find_by(grocery_id: self.grocery_id, product_id: self.product_id)
		errors.add(:base, "Product already exist in this batch") if existing_entry.present?
	end

end
