class ChargesController < ApplicationController
  #Show a credit card form
  #Create the actual charges
  
  def new
  end
  
  def create
    # $200*100 cents
    @amount = 20000
    
    customer = Stripe::Customer.create(
    :email => 'antiguacoffeehouse@gmail.com',
    :card => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
    :customer => customer.id,
    :amount => @amount,
    :description => 'antiguacano',
    :currency => 'usd'
    )
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
end
