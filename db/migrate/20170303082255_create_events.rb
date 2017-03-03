class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :track, foreign_key: true
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
