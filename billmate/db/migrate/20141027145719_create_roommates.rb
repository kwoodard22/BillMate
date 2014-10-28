class CreateRoommates < ActiveRecord::Migration
  def change
    create_table :roommates do |t|
      t.string :name
      t.string :email
      t.integer :house_id

      t.timestamps
    end
  end
end
