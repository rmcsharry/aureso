class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :car_slug
      t.string :max_speed
      t.string :max_speed_on_track

      t.timestamps
    end
  end
end
