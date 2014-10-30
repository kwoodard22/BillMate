class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :roommate, index: true

      t.timestamps
    end
  end
end
