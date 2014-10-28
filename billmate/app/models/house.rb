class House < ActiveRecord::Base
  
  has_many :roommates, dependent: :destroy
  accepts_nested_attributes_for :roommates, allow_destroy: true # { |attributes| attributes['name'].blank? }
end
