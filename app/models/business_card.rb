class BusinessCard < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :email, presence: true
  validates :web_site, presence: true
  validates :phone_number, presence: true

  scope :desending, -> { order(created_at: :desc) }

  def already_exists
    business_card = BusinessCard.find_by(name: name, category_id: category_id)
    if !!business_card && business_card != self 
      errors.add(:name, "has already been added as a category")
    end
  end

  def name_category
    "#{name} - #{cagegory}"
  end

  def category_attributes=(hash)
    category = Category.find_or_create_by(name: hash[:name])
    self.category = category
  end
end
