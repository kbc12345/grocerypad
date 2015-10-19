module Builder
  class Groceries

    def initialize grocery
      @grocery = grocery
    end

    def build
      @collection = get_items_list
      {
        month: @grocery.month,
        year: @grocery.year,
        half: @grocery.half,
        status: @grocery.status,
        items: @collection
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
      list.each do |obj|
        result[:grocery_items].push grocery_item_details(obj)
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
      total = 0.0
      list.each do |l|
        total = total + (l.price.to_f*l.quantity)
      end
       return {total_price: total}
    end

  end
end
