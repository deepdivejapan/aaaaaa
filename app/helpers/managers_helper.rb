module ManagersHelper
    
  def current_manager
    @current_manager ||= Manager.find_by(id: session[:id]) 
  end    
    
  def manager_signed_in?
    current_user.present?
  end  
end
