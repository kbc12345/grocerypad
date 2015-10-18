class Product < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true

    belongs_to :product_category
    has_many :logs, class_name: "Log", foreign_key: "parent_id"
    has_many :grocery_items, class_name: "GroceryItem", foreign_key: "product_id"


end