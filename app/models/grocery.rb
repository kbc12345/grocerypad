class Grocery < ActiveRecord::Base

  has_many :grocery_items
  validates :month, uniqueness: {scope: [:year, :half]}

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
    # x = sanitize_sql_array(["(select * from products INNER JOIN grocery_items on grocery_items.product_id = products.id where grocery_items.grocery_id = ?)", self.id])

    # GroceryItem.select(INDEX_DETAILS).
    # from("product_categories").
    # joins("left join "+x+" as items on items.product_category_id = product_categories.id")

    GroceryItem.select(INDEX_DETAILS).
    from("product_categories LEFT JOIN (select "+Grocery::ITEM_DETAILS+" from products INNER JOIN grocery_items on grocery_items.product_id = products.id where grocery_items.grocery_id = "+self.id.to_s+") as items on items.product_category_id = product_categories.id")
  end

  def self.first_or_copy_latest
    @grocery = Grocery.create(month: Date.today.month.to_i, year: Date.today.year.to_i, half: Date.today.day.to_i/15.0 <= 1 ? (1) : (2), status: "pending")
    if Grocery.count > 1
      columns = [:product_id, :quantity, :grocery_id]
      list = []
      Grocery.latest_grocery(1).grocery_items.each do |t|
        list.push [t.product_id, t.quantity, @grocery.id]
      end
      GroceryItem.import(columns, list)
    end
    @grocery  
  end

  def self.latest_grocery(offset)
      offset(offset).order(year: "desc", month: "desc", half: "desc").first
  end

end
