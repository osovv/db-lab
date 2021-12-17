class CreateFactories < ActiveRecord::Migration[7.0]
  def change
    create_table :factories do |t|
      t.string :name
      t.string :address
      t.string :director_name

      t.timestamps
    end
  end
end
