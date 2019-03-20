class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :manager_id
      t.string :description

      t.timestamps
    end
  end
end
