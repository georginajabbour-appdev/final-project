class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :user_id
      t.integer :leg_id

      t.timestamps
    end
  end
end
