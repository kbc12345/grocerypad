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


  def self.index_details grocery_id
    select(INDEX_DETAILS).from("products inner join grocery_items on products.id = grocery_items.product_id inner join product_categories on product_categories.id = products.product_category_id").where("grocery_items.grocery_id = #{grocery_id}")
  end

  

  def total_price list
    total = 0.0
    list.each do |l|
      total = total + (l.price.to_f*l.quantity)
    end
     return {total_price: total}
  end

  def self.find_grocery month, year, half
    Grocery.where(month: month, year: year, half: half).first
  end

  def find_grocery_items grocery_id
      collection = []
      @items = Grocery.index_details(grocery_id).group_by(&:product_category_name)
      @items.each do |key, list|
        collection.push product_categories(list[0]).merge(total_price(list)).merge({grocery_items: list})
        total_price(list)
      end
      collection
  end

  # def grocery_item_lists list
  #   collection = []
  # end

  def product_categories cat
    {
        product_category_name: cat.product_category_name,
        product_category_id: cat.product_category_id
    }
  end

  def create_json grocery, collection
    {
      month: grocery.month,
      year: grocery.year,
      half: grocery.half,
      status: grocery.status,
      items: [
        collection
      ]
    }
    
  end

end