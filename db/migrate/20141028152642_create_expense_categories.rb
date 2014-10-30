class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.string :account_number
      t.integer :phone
      t.boolean :autopay
      t.string :comments
      t.boolean :utility
      t.integer :house_id

      t.timestamps
    end
  end
end
