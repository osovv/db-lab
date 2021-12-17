class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :factory, null: false, foreign_key: true
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :technology, null: false, foreign_key: true
      t.string :name
      t.string :designation
      t.integer :weight

      t.timestamps
    end
  end
end
