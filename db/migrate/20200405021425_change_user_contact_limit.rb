class ChangeUserContactLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :contact, :bigint
  end
end
