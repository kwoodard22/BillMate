class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :house
  # validates :email, uniqueness: true
  # has_many :roommates, through: :house
  
  # def self.this_month_invoices
  #   house.expense_categoru.invoices.each do |invoice|
  #     if invoice.invoice_period.strftime("%B %Y") == Date.today.strftime("%B %Y")
  #       @month_invoices << invoice
  #     end
  #   end
  # end
end
