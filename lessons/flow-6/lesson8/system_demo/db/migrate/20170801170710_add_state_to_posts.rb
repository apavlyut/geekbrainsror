class AddStateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :state, :integer, default: 0
  end
end
