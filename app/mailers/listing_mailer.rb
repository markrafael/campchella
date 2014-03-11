class ListingMailer < ActionMailer::Base
  default from: "mark@markrafael.com"
  
  def new_listing_email
    @email = 'mark@markrafael.com'
    mail(to: @email, subject: 'New Listing(s) Found')
  end
end
