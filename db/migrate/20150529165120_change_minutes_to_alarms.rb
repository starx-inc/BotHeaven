class ChangeMinutesToAlarms < ActiveRecord::Migration[4.2]
  def change
    change_column :alarms, :minutes, :float
  end
end
