class Api::GroceryItemsController < ApiController

  before_action :find_obj, except: [:index, :create]

  def create
    @obj = GroceryItem.new(obj_params)
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

  def obj_params
    params.require(:grocery_item).permit(*%i(
      product_name
      product_category
      quantity
    ))
  end

  def find_obj
    @obj = GroceryItem.find(params[:id])
  end

end