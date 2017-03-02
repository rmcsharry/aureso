class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :max_speed

      t.timestamps
    end
    add_index :cars, :name, :unique => true
    add_index :cars, :slug, :unique => true
  end
end
