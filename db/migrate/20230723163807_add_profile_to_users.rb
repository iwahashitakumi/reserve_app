class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text
    add_column :users, :image, :string
  end
end