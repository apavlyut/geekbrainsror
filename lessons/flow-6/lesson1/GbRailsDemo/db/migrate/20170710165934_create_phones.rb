class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :vendor
      t.string :model
      t.integer :version
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
