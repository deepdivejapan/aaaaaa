class SampleMailer < ApplicationMailer
  
  def send_blog_create(user)
    @user = user
    mail to: @user.email, subject: 'ブログが作成されました'
  end
end  