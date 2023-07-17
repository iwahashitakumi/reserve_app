class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :home_name
      t.text :home_type
      t.integer :money
      t.string :address
      t.string :home_image
      t.timestamps
    end
  end
end
