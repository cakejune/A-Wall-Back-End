class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :requestor, null: false
      t.references :acceptor, null: false
      t.boolean :accepted?, default: false, null: false

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :requestor_id
    add_foreign_key :friend_requests, :users, column: :acceptor_id
  end
end
