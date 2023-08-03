class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :introduction, :text, null: false, default: ""
    add_column :users, :image, :string, null: false, default: ""
  end
end
