class Api::GroceryItemsController < ApiController

  before_action :find_grocery
  before_action :find_obj, except: [:index, :create]

  def create
    @obj = @grocery.grocery_items.new(obj_params)
    create_helper
  end

  def update
    update_helper
  end

  def index
    render json: {collection: GroceryItem.all}
  end

  def destroy
    delete_helper
  end

  private

  def obj_params
    params.require(:grocery_item).permit(*%i(
      product_id
      quantity
    ))
  end

  def find_grocery
    @grocery = Grocery.find(params[:grocery_id])
  end

  def find_obj
    @obj = @grocery.grocery_items.find(params[:id])
  end

end
