class SampleMailer < ApplicationMailer
  
  def send_event_create(user)
    @user = user
    mail to: @user.email, subject: 'イベントが承認されました'
  end
end  