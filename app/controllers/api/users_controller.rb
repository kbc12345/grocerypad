class Api::UsersController < ApiController

  before_action :find_obj, except: [:index, :create]

  def create
    @obj = User.new(obj_params)
    create_helper
  end

  def update
    update_helper
  end

  def index
    render json: {collection: User.all}
  end

  def destroy
    delete_helper
  end

  def obj_params
    params.require(:user).permit(*%i(
      first_name
      last_name
      email
      password
    ))
  end

  def find_obj
    @obj = User.find(params[:id])
  end

end