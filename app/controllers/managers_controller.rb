class ManagersController < ApplicationController
  def index
    @events = Event.all
    @events = Event.search(params[:search])
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def allow
    @event = Event.find(params[:id])
    @event.allow = true
    @event.save
    redirect_to managers_index_path
  end  
  
  def back
    @event = Event.find(params[:id])
    @event.allow = false
    @event.save
    redirect_to managers_index_path
  end  
  
  
  private  
   def event_params
    params.require(:event).permit(:title, :place, :event_date, :content, :user_id, :image, :image_cache, :allow)
   end 
   
   def search
   #ViewのFormで取得したパラメータをモデルに渡す
    @events = Event.search(params[:search])
    redirect_to managers_index_path
   end  
  
  
end

  