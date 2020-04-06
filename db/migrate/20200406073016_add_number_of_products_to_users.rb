class AddNumberOfProductsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :number_of_products, :integer
  end
end
