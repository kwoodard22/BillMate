class ExpenseCategory < ActiveRecord::Base
  belongs_to :house
  has_many :invoices

  accepts_nested_attributes_for :invoices, allow_destroy: true
end
