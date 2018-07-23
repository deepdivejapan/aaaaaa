class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @user.email, subject: 'お問い合わせが完了しました'
    mail to:"riodejaneiro1989@gmail.com", subject:"お問い合わせの確認メール"
  end
end