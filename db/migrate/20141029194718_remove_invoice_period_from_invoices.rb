class RemoveInvoicePeriodFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoice_period, :string
  end
end
