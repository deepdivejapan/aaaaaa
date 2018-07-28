class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:user_session][:email].downcase) #データベースから該当するレコードを検索
    if user && user.authenticate(params[:user_session][:password])
       session[:user_id] = user.id
       redirect_to user_path(user.id)
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
    end 
  end  
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_user_session_path
  end
  
  private
  def user_sessions_params
    params.require(:user_session).permit(:name, :email, :capacity, :password,
                                 :password_confirmation,:image)
  end
  
end
    
