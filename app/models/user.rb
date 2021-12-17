class User < ApplicationRecord
    has_secure_password
    has_many :business_cards
end
