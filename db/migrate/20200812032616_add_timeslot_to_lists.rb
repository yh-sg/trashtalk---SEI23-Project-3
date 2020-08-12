class AddTimeslotToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :timeslot, :time
  end
end
