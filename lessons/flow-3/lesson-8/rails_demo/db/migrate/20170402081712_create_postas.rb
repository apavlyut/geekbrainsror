class CreatePostas < ActiveRecord::Migration[5.0]
  def change
    create_table :postas do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
