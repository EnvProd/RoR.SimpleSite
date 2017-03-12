class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
