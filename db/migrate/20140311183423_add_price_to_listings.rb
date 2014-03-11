class AddPriceToListings < ActiveRecord::Migration
  def change
    add_column :listings, :price, :int
  end
end
