class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.integer :status
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
