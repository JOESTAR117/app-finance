class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.date :data
      t.string :description, limit: 150
      t.integer :value
      t.string :types, limit: 55

      t.timestamps
    end
  end
end
