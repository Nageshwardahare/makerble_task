class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.integer :age
      t.string :diagnosis
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
