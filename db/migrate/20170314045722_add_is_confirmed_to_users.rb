class AddIsConfirmedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_confirmed, :boolean, default: false
  end
end
