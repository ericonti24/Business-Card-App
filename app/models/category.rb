class Category < ApplicationRecord
    has_many :business_cards
    has_many :users, through: :business_cards

    validates :name, presence: true

    scope :filter_duplicates, -> { group(:name).having("count(*) >= 1")}

end
