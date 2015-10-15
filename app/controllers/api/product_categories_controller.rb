class Api::ProductCategoriesController < ApiController

  before_action :find_obj, except: [:index, :create]

  def create
    @obj = ProductCategory.new(obj_params)
    create_helper
  end

  def update
    update_helper
  end

  def index
    render json: {collection: ProductCategory.all}
  end

  def destroy
    delete_helper
  end

  def obj_params
    params.require(:product_category).permit(*%i(
      name
    ))
  end

  def find_obj
    @obj = ProductCategory.find(params[:id])
  end

end