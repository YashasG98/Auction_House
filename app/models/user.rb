class User < ApplicationRecord

    has_secure_password

    validates :contact,{uniqueness:true,length: { minimum: 10, maximum: 10 },numericality: { only_integer: true }}  
    validates :name, {presence:true}
    validates :address, {presence:true}
    
end
