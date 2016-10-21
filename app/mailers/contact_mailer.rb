class ContactMailer < ApplicationMailer

  def sended_email(contact)
    @contact = contact
    mail(to: get_ito_mail, subject: '問い合わせがありました。')
  end
end
