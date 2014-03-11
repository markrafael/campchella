require 'craigslist'

namespace :craigslist do
  desc "Update database with Craigslist listings"
  task update: :environment do
    
    record_count = Listing.count
        
    # Get Listings
    search_object = Craigslist.city(:sfbay).category(:for_sale).query('coachella camping')
    results = search_object.fetch

    # Check DB if Listing Exists
    results.each do |result|
      listing = Listing.find_or_create_by(title: result['text'])
      listing.url = result['href']
      listing.price = result['price']
      listing.location = result['location']
      listing.save
    end
    
    record_count_after_update = Listing.count
    @new_records = record_count_after_update - record_count
 
    if @new_records > 0
      puts 'Listing database updated.'
      puts "#{@new_records} listing(s) added."
      ListingMailer.new_listing.deliver
    else
      puts 'No new listings.'
    end

  end
end