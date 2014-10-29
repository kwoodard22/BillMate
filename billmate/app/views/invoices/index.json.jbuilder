json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :date_paid, :expense_category_id, :amount, :paid_by, :comment, :month
  json.url invoice_url(invoice, format: :json)
end
