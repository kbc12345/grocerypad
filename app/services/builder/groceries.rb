module Builder
  class Groceries

    def initialize grocery_id
      @grocery_id = grocery_id
    end

    def grocery_items
      collection = []
      Grocery.index_details(@grocery_id).group_by(&:product_category_name).each do |product_category_name, list|
        collection.push category_details(list[0]).merge(item_details(list))
      end
      collection
    end

    private

    def category_details obj
      {
        product_category_name: obj.product_category_name,
        product_category_id: obj.product_category_id
      }
    end

    def item_details list
      result = {grocery_items: []}
      list.each do |obj|
        result[:grocery_items].push grocery_item_details()
      end
      result
    end

    def grocery_item_details obj
      {
        id: obj.id,
        product_name: obj.product_name
      }
    end

  end
end
