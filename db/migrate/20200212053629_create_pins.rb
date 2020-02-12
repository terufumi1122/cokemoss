class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.integer :pin_id, null: false
      t.string :pin_url, null: false
      t.string :image_url, null: false
      t.integer :width, null: false
      t.integer :height, null: false

      t.timestamps
    end
  end
end
