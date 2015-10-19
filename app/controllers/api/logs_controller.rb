class Api::LogsController < ApiController

  before_action :find_obj, except: [:index, :create]
  before_action :find_parent, only: [:create, :index]

  def create
    @obj = @parent.logs.new(obj_params.merge({user_id: current_user.id, parent_type: @parent_type}))
    create_helper
  end

  def update
    update_helper
  end

  def index
    render json: {collection: Log.where(parent_type: @parent_type, parent_id: @parent.id)}
  end

  def destroy
    delete_helper
  end

  private

  def obj_params
    params.require(:log).permit(*%i(
      content
    ))
  end

  def find_obj
    @obj = Log.find(params[:id])
  end

  def find_parent
    @parent_type = params[:parent_type]
    if @parent_type == "product"
      @parent = Product.find(params[:product_id])
    elsif @parent_type == "grocery_item"
      @parent = GroceryItem.find(params[:grocery_item_id])
    end
  end

end