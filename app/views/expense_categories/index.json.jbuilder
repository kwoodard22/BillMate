json.array!(@expense_categories) do |expense_category|
  json.extract! expense_category, :id, :name, :account_number, :phone, :autopay, :comments, :utility, :house_id
  json.url expense_category_url(expense_category, format: :json)
end
