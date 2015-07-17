class InviteMailer < ApplicationMailer
  def invite_email(letter, target_email)
    @letter = letter
    @target_email = target_email
    mail(to: target_email, subject: '婚格 - 邀请你帮我来一起筹备婚礼')
  end
end
