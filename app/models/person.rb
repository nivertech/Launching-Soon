class Person < ActiveRecord::Base
  belongs_to :referrer, :class_name => 'Person', :foreign_key => 'referred_by'
  has_many :referrals,  :class_name => 'Person', :foreign_key => 'referred_by'
  
  before_create :create_referral_code
  after_create  :email_notifications
  
  validates_presence_of   :email#, :name
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of     :email, :within => 3..100
  validates_format_of     :email,
                          :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message => 'email must be valid'
  
  def email=(email)
    write_attribute(:email, email.strip) unless email.blank?
  end
  
  private
  
  def create_referral_code
    self.referral_code = rand(36**8).to_s(36)
  end
  
  def email_notifications
    Mailer.confirmation(self).deliver  
    
    if self.referrer && self.referrer.referrals.size == 3
      Mailer.vip(self.referrer).deliver
    end
  end
end