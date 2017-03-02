class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.string :car_slug, null: false
      t.string :max_speed
      t.string :max_speed_on_track

      t.timestamps
    end
    add_index :cars, :name, :unique => true
    add_index :cars, :car_slug, :unique => true
  end
end
