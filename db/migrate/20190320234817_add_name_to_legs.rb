class AddNameToLegs < ActiveRecord::Migration[5.1]
  def change

  add_column :legs, :name, :string

  end
end
