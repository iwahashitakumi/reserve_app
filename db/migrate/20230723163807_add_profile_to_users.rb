class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text, default: ""
    add_column :users, :image, :string,  default: ""
  end
end
