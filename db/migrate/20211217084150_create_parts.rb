class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :weight
      t.string :dimensions
      t.belongs_to :vendor, null: false, foreign_key: true
      t.date :ship_date

      t.timestamps
    end
  end
end
