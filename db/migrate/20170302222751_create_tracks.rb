class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :surface_type, default: 0, null: false # for enum

      t.timestamps
    end
    add_index :tracks, :name, :unique => true
  end
end
