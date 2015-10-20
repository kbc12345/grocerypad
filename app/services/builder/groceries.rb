module Builder
  class Groceries

    def initialize grocery
      @grocery = grocery
    end

    def build
      {
        id: @grocery.id,
        month: @grocery.month,
        year: @grocery.year,
        half: @grocery.half,
        status: @grocery.status,
        items: get_items_list
      }
    end

    private

    def get_items_list
      collection = []
      @items = @grocery.grocery_items_full_details.group_by(&:product_category_name)
      @items.each do |product_category_name, list|
        collection.push category_details(list[0]).merge(total_price(list)).merge(item_details(list))
      end
      collection
    end

    def category_details obj
      {
        product_category_name: obj.product_category_name,
        product_category_id: obj.product_category_id
      }
    end

    def item_details list
      result = {grocery_items: []}
      if list[0].product_id.present?
        list.each do |obj|
          result[:grocery_items].push grocery_item_details(obj)
        end
      end
      result
    end

    def grocery_item_details obj
      {
        id: obj.id,
        product_name: obj.product_name,
        quantity: obj.quantity,
        price: obj.price,
        total: obj.total,
        product_status: obj.product_status,
        product_id: obj.product_id
      }
    end

    def total_price list
      total_price = {total_price: 0}
      if list[0].product_id.present?
        total = 0.0
        list.each do |l|
          total = total + (l.price.to_f*l.quantity)
        end
        total_price = {total_price: total}
      end
      total_price
    end

  end
end
