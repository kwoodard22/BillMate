class Roommate < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  
  belongs_to :house, inverse_of: :roommates
  has_many :payments
  has_many :invoices, through: :payments
  # has_many :roommates, through: :house
  # validates_presence_of :house_id
  # Use inverse_of & validates_presence_of if you want to
  # validate that a child record is associated with a parent
  # record. But Dash says Rails will guess if not added.
  
end
