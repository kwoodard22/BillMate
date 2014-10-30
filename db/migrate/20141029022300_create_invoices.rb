class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date_paid
      t.date :invoice_date
      t.integer :expense_category_id
      t.float :amount
      t.string :comment
      t.string :invoice_period

      t.timestamps
    end
  end
end
