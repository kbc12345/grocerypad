class Api::SessionsController < ApiController
  skip_before_action :authenticate_request

  # POST: /api/session
  #
  def create
    google_user = Oauth::GoogleAuthenticator.new(params).fetch_user
    user = User.find_or_initialize_by(email: google_user[:emails].first["value"])

    user.update(access_token: google_user[:access_token])

    render json: {token: user.auth_token, user: user}
  end

  def show
    render json: {token: current_user.auth_token, user: current_user}
  end

end
