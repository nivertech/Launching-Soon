class Mailer < ActionMailer::Base
  default_url_options[:host] = DEFAULT_HOST
  default :from => "Kate Singleton <kate@arthound.net>"
  
  
  def confirmation(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "Thanks for signing up for Buy Some Damn Art!")
  end
  
  def vip(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "Thanks for the referrals!")
  end  
end
