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
    render json: {collection: Grocery.all}
  end

  def destroy
    delete_helper
  end

  def obj_params
    params.require(:grocery).permit(*%i(
      status
      month
      year
      half
    ))
  end

  def find_obj
    @obj = Grocery.find(params[:id])
  end

end