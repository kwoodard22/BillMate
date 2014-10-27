class House < ActiveRecord::Base
  has_many :roommates, dependent: :destroy

end
