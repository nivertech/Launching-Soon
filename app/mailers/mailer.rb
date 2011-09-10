class Mailer < ActionMailer::Base
  default_url_options[:host] = DEFAULT_HOST
  default :from => "Buy Some Damn Art <buysomedamnart@arthound.net>"
  
  
  def confirmation(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "Thanks for signing up!")
  end
  
  def vip(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "Thanks for the referrals!")
  end  
end
