class ImplementActsAsList < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :position, :integer
    add_column :images, :position, :integer

    add_index :galleries, :position
    add_index :images, :position
  end
end
