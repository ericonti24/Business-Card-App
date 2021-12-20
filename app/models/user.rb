class User < ApplicationRecord
    has_secure_password
    has_many :business_cards

    validates :username, uniqueness: true, presence: true, length: {minimum: 5}
    validates :email, uniqueness: true, presence: true
    validates :password, length: {in: 6..50} 

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
          u.username = auth["info"]["name"]
          u.password = SecureRandom.hex
        end
    end
end
