class Invoice < ActiveRecord::Base
  belongs_to :expense_category
  has_one :payment
  has_one :roommate, through: :payment
  validates :expense_category_id, presence: true
  validates :invoice_period, presence: true
  validates :amount, numericality: true

  accepts_nested_attributes_for :payment
end
