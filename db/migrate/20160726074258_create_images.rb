class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :caption
      t.string :saleopt
      t.string :fileimage

      t.references :gallery, index: true

      t.timestamps
    end
  end
end
