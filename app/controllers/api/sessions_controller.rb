class Api::SessionsController < ApiController
  skip_before_action :authenticate_request

  # POST: /api/session
  #
  def create
    binding.pry
    render json: {token: "haha"}
  end

end
