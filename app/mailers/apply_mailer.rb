class ApplyMailer < ApplicationMailer
  def received_email(apply)
    @apply = apply
    mail(to: @apply.email, subject: 'ご応募ありがとうございました。')
  end

  def sended_email(apply)
    @apply = apply
    @project = Project.find(@apply.project_id)

    attachments[@apply.avatar] = {
       :content => File.read(@apply.file_path, :mode => 'rb'),
       :transfer_encoding => :binary
     }
    mail(to: get_ito_mail, subject: 'エントリーがありました。')
  end
end
