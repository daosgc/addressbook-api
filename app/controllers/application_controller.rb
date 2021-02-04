class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def user_not_authorized(error)
    render json: { error: error.message }, status: :unauthorized
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
