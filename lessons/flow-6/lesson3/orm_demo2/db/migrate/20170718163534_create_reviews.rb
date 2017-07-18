class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :book, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
