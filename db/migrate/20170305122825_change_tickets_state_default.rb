class ChangeTicketsStateDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tickets, :status, from: nil, to: 0
  end
end
