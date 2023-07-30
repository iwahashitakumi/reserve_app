class AddPeopleToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :people, :integer
  end
end
