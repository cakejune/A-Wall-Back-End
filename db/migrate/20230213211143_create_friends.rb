class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.references :requestor, null: false
      t.references :acceptor, null: false

      t.timestamps
    end
    add_foreign_key :friends, :users, column: :requestor_id
    add_foreign_key :friends, :users, column: :acceptor_id
  end
end
