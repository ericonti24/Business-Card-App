class Category < ApplicationRecord
    has_many :business_cards

    scope :filter_duplicates, -> { group(:name).having("count(*) >= 1")}

end
