class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.belongs_to :factory, null: false, foreign_key: true
      t.string :chief_name

      t.timestamps
    end
  end
end
