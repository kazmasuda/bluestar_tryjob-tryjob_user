class ApplicationMailer < ActionMailer::Base
  default from: "TryJOB.com"   # 送信元アドレス
  layout 'mailer'

  def get_ito_mail
    return 'takeshi.ito@bluestar.jpn.com'
  end

  def get_hayashi_mail
    return 'daisuke.hayashi@bluestar.jpn.com'
  end
end
