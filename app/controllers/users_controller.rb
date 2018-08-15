class UsersController < ApplicationController
  before_action :logged_in?, only:[:show]
  
  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end 
  end  
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:success] = "Profileを編集しました！"
     redirect_to user_path
   else
    render 'edit'
   end 
  end
  
  private
  def user_params
    params.require(:user).permit(:id,:name, :email, :capacity, :password,
                                 :password_confirmation,:image)
  end
end
