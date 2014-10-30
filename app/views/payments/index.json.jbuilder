json.array!(@payments) do |payment|
  json.extract! payment, :id, :invoice_id, :roommate_id
  json.url payment_url(payment, format: :json)
end
