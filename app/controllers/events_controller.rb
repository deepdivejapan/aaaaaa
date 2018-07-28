class EventsController < ApplicationController
  before_action :set_event, only:[:edit,:update,:destroy,:show]
  before_action :logged_in?, only:[:show]
  
  def index
   @events = Event.all
   @events = Event.search(params[:search])
  end
  
  
  def new
   if params[:back]
    @event = Event.new(event_params)
   else
    @event = Event.new
   end 
  end  
  
  def create
   @event = Event.new(event_params)
   @event.user_id = current_user.id
   if @event.save
    SampleMailer.send_event_create(current_user).deliver
    flash[:success] = "イベントが作成されました。承認されると一覧に表示されます。"
    redirect_to events_path
   else
    render'new'
   end 
  end
  
  def show
   @event = Event.find(params[:id])
  end 
  
  def edit
   @event = Event.find(params[:id])
  end
  
  def update
   @event = Event.find(params[:id])
   if @event.update(event_params)
     flash[:success] = "イベントを編集しました！"
     redirect_to events_path
   else
    render 'edit'
   end 
  end
  
  def destroy
    if current_user
      @event = Event.find(params[:id])
      @event.destroy
        flash[:success] ="イベントを削除しました！"
      redirect_to events_path
    end
  end 
  
  def confirm
   @event = Event.new(event_params)
   @event.user_id = current_user.id
   render :new if @event.invalid?
  end 
  
  private  
   def event_params
    params.require(:event).permit(:title, :place, :event_date, :content, :user_id, :image, :image_cache, :allow)
   end 
   
   def set_event
     @event = Event.find(params[:id])
   end 
   
   def search
   #ViewのFormで取得したパラメータをモデルに渡す
    @events = Event.search(params[:search])
   end
end  

