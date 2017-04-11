class ApplicationController < ActionController::Base
  before_action :restrict_access
  protect_from_forgery with: :exception

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
