class PeopleController < ApplicationController  
  def new
    capture_referral
    
    @person = Person.new
    # signup page
  end
  
  def create
    @person = Person.new(params[:person])
    
    @person.referred_by = session[:referred_by] if session[:referred_by]
    
    if @person.save
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:notice] = "There was an error saving you're address, but we'll fix it asap!"
    end
    redirect_to root_url
  end
  
  def subscribed
    redirect_to root_url, :notice => "Thanks for signing up!"
  end

  private
  
  def capture_referral
    if params[:referral_code]
      @referrer = Person.find_by_referral_code(params[:referral_code])
      session[:referred_by] = @referrer.id if @referrer
      
      redirect_to root_url
    end
  end
end
