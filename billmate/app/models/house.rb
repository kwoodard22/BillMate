class House < ActiveRecord::Base
  belongs_to :user
  has_many :roommates, dependent: :destroy
  has_many :expense_categories, dependent: :destroy
  
  accepts_nested_attributes_for :roommates, :expense_categories, allow_destroy: true # { |attributes| attributes['name'].blank? }
  validates :name, presence: true
end
