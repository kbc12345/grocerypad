class Api::GroceriesController < ApiController

  before_action :find_obj, except: [:index, :create]

  def create
    @obj = Grocery.new(obj_params)
    create_helper
  end

  def update
    update_helper
  end

  def index
    @grocery = Grocery.find_grocery(params[:month], params[:year], params[:half])
    @collection = @grocery.find_grocery_items(@grocery.id)
    render json: @grocery.create_json(@grocery, @collection)
  end

  def destroy
    delete_helper
  end

  def obj_params
    params.require(:grocery).permit(*%i(
      month
      year
      half
      status
    ))
  end

  def find_obj
    @obj = Grocery.find(params[:id])
  end

end