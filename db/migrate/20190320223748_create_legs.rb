class CreateLegs < ActiveRecord::Migration[5.1]
  def change
    create_table :legs do |t|
      t.integer :trip_id

      t.timestamps
    end
  end
end
