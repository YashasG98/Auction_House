class AddBidDetailsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :bidder_id, :integer
    add_column :products, :bid_value, :integer
    add_column :products, :claimed, :boolean
  end
end
