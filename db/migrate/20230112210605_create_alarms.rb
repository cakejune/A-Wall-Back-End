class CreateAlarms < ActiveRecord::Migration[7.0]
  def change
    create_table :alarms do |t|
      t.string :name
      t.time :alarm_time
      t.integer :user_id

      t.timestamps
    end
  end
end
