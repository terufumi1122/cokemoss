class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :cursor

      t.timestamps
    end
  end
end
