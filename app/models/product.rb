class Product < ApplicationRecord

    validates :name, {presence:true}
    validates :start_bid,{numericality: { only_integer: true }}
    validates :image,{presence:true}
    validates :deadline_date,{presence:true}
    validates :deadline_time,{presence:true}

end