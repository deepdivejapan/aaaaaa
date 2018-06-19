class BlogsController < ApplicationController
  before_action :set_blog, only:[:edit,:update,:destroy]
  before_action :login_check, only:[:new,:show,:edit,:destroy]
  
  def top
    @blog = Blog.new
  end
  
  def index
   @blogs = Blog.all
  end
  
  def new
   if params[:back]
    @blog = Blog.new(blog_params)
   else
    @blog = Blog.new
   end 
  end  
  
  def create
   @blog = Blog.new(blog_params)
   @blog.user_id = current_user.id
   if @blog.save
    SampleMailer.send_blog_create(current_user).deliver
    flash[:success] = "ブログを作成しました！"
    redirect_to blogs_path
   else
    render'new'
   end 
   
   
  end
  
  def show
   @blog = Blog.find(params[:id])
  end 
  
  def edit
   @blog = Blog.find(params[:id])
  end
  
  def update
   @blog = Blog.find(params[:id])
   if @blog.update(blog_params)
     flash[:success] = "ブログを編集しました！"
     redirect_to blogs_path
   else
    render 'edit'
   end 
  end
  
  def destroy
    if current_user
      @blog = Blog.find(params[:id])
      @blog.destroy
        flash[:success] ="ブログを削除しました！"
      redirect_to blogs_path
    end
  end 
  
  def confirm
   @blog = Blog.new(blog_params)
   render :new if @blog.invalid?
  end 
  
  private  
   def blog_params
    params.require(:blog).permit(:title, :content, :user_id,:image)
   end 
   
   def set_blog
     @blog = Blog.find(params[:id])
   end 
end  

# privateメソッドから呼び出しているのは、予期せぬ所からblog_paramsを呼び出せないようにするためです。
# ※上記の場合で、仮に blog_params 以降に新規のメソッドを記述した場合、private の効果が適用されてしまいます。
# StrongParameter 以外のメソッドは private よりも上に記述しましょう。
