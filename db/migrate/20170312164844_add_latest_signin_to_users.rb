class AddLatestSigninToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :latest_signin, :timestamp
  end
end
