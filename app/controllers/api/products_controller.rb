class Api::ProductsController < ApiController

  before_action :find_obj, except: [:index, :create]
  before_action :find_cat, only: :create

  def create
    @obj = @category.products.new(obj_params.merge({creator_id: current_user.id, updator_id: current_user.id}))
    if @obj.save
      render json: {product: @obj, product_category: @category.name}
    else
      obj_errors
    end
  end

  def update
    obj_params.merge(updator_id: current_user.id)
    update_helper
  end

  def index
    render json: Product.order("name")
  end

  def destroy
    delete_helper
  end

  private

  def find_obj
    @obj = Product.find(params[:id])
  end

  def obj_params
    params.require(:product).permit(*%i(
      name
      price
      status
    ))
  end

  def find_cat
    @category = ProductCategory.find(params[:product_category_id])
  end

end
