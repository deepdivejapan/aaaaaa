module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end
  
  def logged_in?
    current_user.present?
  end
  
  def login_check
    unless current_user
      redirect_to new_session_path
    end
  end  
  
  def reset_user_session
    if @current_user == nil
      redirect_to new_session_path
    end
  end
  
end
