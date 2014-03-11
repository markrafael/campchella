class ListingsController < ApplicationController
  def index
    @listings = Listing.all.order(created_at: :desc)
  end

  def show
  end
end
