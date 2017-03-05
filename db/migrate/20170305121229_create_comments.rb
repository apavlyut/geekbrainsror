class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.text :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end