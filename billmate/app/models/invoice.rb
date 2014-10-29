class Invoice < ActiveRecord::Base
  belongs_to :expense_category
end
