class MakeDateAndTimeSeparate < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :deadline_date, :date
    add_column :products, :deadline_time, :bigint
    remove_column :products, :deadline
  end
end
