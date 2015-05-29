class ChangeMinutesToAlarms < ActiveRecord::Migration
  def change
    change_column :alarms, :minutes, :float
  end
end
