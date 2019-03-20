class CreateRoomateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :roomate_requests do |t|
      t.integer :requestor_id
      t.integer :recipient_id
      t.boolean :approved
      t.integer :hotel_id

      t.timestamps
    end
  end
end
