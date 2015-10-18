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
    find_grocery_items
    render json: create_json
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

  def find_grocery
    @grocery = Grocery.where(month: params[:month], year: params[:year], half: params[:half]).first
  end

  def find_grocery_items
    @hash = {}
    find_grocery
    @items = Grocery.index_details(@grocery.id)
    @items.each do |i|
      array = []
      if @hash.key?(i.product_category_name)
        array = @hash[i.product_category_name]
        array << i
        @hash[i.product_category_name] = array
      else
        array << i
        @hash[i.product_category_name] = array
      end
    end
  end

  def create_json
    {
      month: @grocery.month,
      year: @grocery.year,
      half: @grocery.half,
      status: @grocery.status,

      items: [
        @hash
      ]
    }
  end

  def json_helper
    
  end

end