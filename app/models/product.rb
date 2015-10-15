class Product < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true

    belongs_to :product_category



end