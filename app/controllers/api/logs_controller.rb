class Api::LogsController < ApiController

  def index
    render json: Logs::Builder.new(params[:parent_type],params[:parent_id]).build
  end

end
