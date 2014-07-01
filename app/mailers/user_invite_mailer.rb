class UserInviteMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite_email(email, business)
    @url  = 'http://tillr.felixcohen.co.uk/users/sign_up?token=#{@business.token}'
    mail(to: email, subject: '#{@business.name} has invited you to use their Tillr')
  end
end
