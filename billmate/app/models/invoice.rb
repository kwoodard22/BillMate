class Invoice < ActiveRecord::Base
  belongs_to :expense_category
  validates :expense_category_id, presence: true
  validates :invoice_period, presence: true
  validates :amount, numericality: true
end
