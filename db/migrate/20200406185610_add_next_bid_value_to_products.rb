class AddNextBidValueToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :next_bid_value, :integer
  end
end
