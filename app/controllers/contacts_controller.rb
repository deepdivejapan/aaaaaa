class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end 
  end

  def edit
    @contact = Contact.find(contact_params)
  end

  def create
    @contact = Contact.new(contact_params)
     if @contact.save
      ContactMailer.contact_mail(@contact).deliver  
      flash[:success] = "お問い合わせが完了しました"
      redirect_to new_contact_path
     else
      render'new'
     end 
  end

 
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirm
   @contact = Contact.new(contact_params)
   render :new if @contact.invalid?
  end 

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to managers_path, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
