class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :students

  private

  helper_method :current_user,
                :authenticate_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate_user
    redirect_to root_path unless current_user
  end

  def students
    @students = Student.all.asc(:name)
  end
end