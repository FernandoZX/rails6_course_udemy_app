class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  after_action :user_activity
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include PublicActivity::StoreController #save current_user using gem public_activity
  include Pagy::Backend

  before_action :set_global_variables, if: :user_signed_in?
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end

  private

  def user_not_authorized #pundit
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def user_activity
    current_user.try :touch
  end
end
