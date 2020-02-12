class ChangeTypePinIdInPin < ActiveRecord::Migration[6.0]
  def up
    change_column :pins, :pin_id, :bigint, null: false
  end

  def down
    change_column :pins, :pin_id, :integer, null: false
  end
end
