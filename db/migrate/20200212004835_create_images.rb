class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :pin_id, null: false
      t.string :url, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
