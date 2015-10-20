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
    @grocery = Grocery.where(month: params[:month], year: params[:year], half: params[:half]).first
    if @grocery.present?
      build_index
    elsif Grocery.should_return_latest({month: params[:month], year: params[:year], half: params[:half]})
      @grocery = Grocery.latest_grocery
      build_index
    else
      render json: {message: 'no data available'}
    end
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

  private

  def build_index
    render json: Builder::Groceries.new(@grocery).build
  end

end