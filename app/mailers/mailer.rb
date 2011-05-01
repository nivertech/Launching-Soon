class Mailer < ActionMailer::Base
  default_url_options[:host] = DEFAULT_HOST
  default :from => "Workflow <info@getworkflow.com>"
  
  
  def confirmation(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "You've been added to our beta invite list")
  end
  
  def vip(person)
    @referral_code = person.referral_code
    mail(:to => person.email, :subject => "Congratulations! You're on our VIP list")  
  end  
end