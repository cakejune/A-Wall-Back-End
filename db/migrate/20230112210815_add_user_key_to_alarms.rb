class AddUserKeyToAlarms < ActiveRecord::Migration[7.0]
  def change
    add_column :alarms, :user_id, :integer
  end
end
