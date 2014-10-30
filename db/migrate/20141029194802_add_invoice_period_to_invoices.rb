class AddInvoicePeriodToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :invoice_period, :date
  end
end
