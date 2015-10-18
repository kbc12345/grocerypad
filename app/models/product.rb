class Product < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  belongs_to :product_category


  def self.complete_details
    select("products.*, product_categories.name as product_category_name").joins(:product_category).order("products.name")
  end


end
