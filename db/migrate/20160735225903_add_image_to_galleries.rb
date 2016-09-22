class AddImageToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :image, :string
  end
end
