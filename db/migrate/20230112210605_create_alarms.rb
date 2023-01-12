class CreateAlarms < ActiveRecord::Migration[7.0]
  def change
    create_table :alarms do |t|
      t.string :name
      t.datetime :alarm_time

      t.timestamps
    end
  end
end
