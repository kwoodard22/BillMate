class House < ActiveRecord::Base
  attr_accessor :name, :roommates_attributes
  has_many :roommates, dependent: :destroy
  accepts_nested_attributes_for :roommates, :reject_if => :all_blank, :allow_destroy => true
end
