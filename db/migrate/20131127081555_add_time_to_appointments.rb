class AddTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :timeslot, :time
  end
end
