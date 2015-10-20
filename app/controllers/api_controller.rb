class ApiController < ApplicationController
  include Common

  protect_from_forgery with: :null_session
  before_action :authenticate_request

  helper_method :current_user,:search_query,:current_page,:permissions,:access_token

  class NotAuthenticatedError < StandardError; end
  rescue_from NotAuthenticatedError do
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end


  class ExpiredSessionError < StandardError; end
  rescue_from ExpiredSessionError do
    render json: { error: 'Your session has expired' }, status: :unauthorized # unofficial expired session
  end


  def authenticate_request
    fail ExpiredSessionError if current_user.nil?
  end


  def current_user
    @current_user ||= User.find_by(auth_token: auth_token) if auth_token
  end

  def current_user_id
    @user_id ||= request.header['UserId']
  end

  def auth_token
    @access_token ||=  request.headers['AuthToken']
  end


  def current_page
    @current_page ||= params[:page].present? ? params[:page] : 1
  end


  protected

  def render_obj_errors(obj = nil)
      render json: {
        message: 'Validation failed', errors: (obj || @obj).errors.full_messages
      }, status: 422
    end

  def obj_not_found
    render json: {
      message: 'ID not found'
    }
  end
end
