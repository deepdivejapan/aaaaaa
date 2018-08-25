class ManagersController < ApplicationController
  before_action :authenticate_manager!, only: [:index,:show,:allow,:back]
  before_action :guard_signup!, only: [:cancel, :new, :destroy, :create, :edit, :update]
  
  def index
      @events = Event.all
      @events = Event.search(params[:search])
      @events = Event.page(params[:page]).per(5)
      @contacts = Contact.all
      @contacts = Contact.page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def allow
    @event = Event.find(params[:id])
    @event.allow = true
    @event.save
    flash[:success] = "イベントを承認しました！"
    redirect_to managers_index_path
  end  
  
  def back
    @event = Event.find(params[:id])
    @event.allow = false
    @event.save
    flash[:success] = "イベントを元に戻しました！"
    redirect_to managers_index_path
  end  
  
  def destroy
      @event = Event.find(params[:id])
      @event.destroy
        flash[:success] ="イベントを削除しました！"
      redirect_to managers_path
  end 
  
  
  private  
   def event_params
    params.require(:event).permit(:title, :place, :event_date, :content, :user_id, :image, :image_cache, :allow)
   end 
   
   def search
   #ViewのFormで取得したパラメータをモデルに渡す
     @events = Event.search(params[:search])
    #  redirect_to managers_index_path
   end 
  
   def guard_signup!
    raise ActionController::RoutingError, 'NOT FOUND'
   end
  
   
  # def authenticate_manager!
  #   redirect_to events_path
  # end   
end

  