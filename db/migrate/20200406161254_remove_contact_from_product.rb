class RemoveContactFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products,:contact
  end
end
