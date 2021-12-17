class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.text :description
      t.string :developer
      t.integer :duration

      t.timestamps
    end
  end
end
