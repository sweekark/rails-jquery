class CreateNotificationLists < ActiveRecord::Migration
  def change
    create_table :notification_lists do |t|
      t.string :name
      t.string :email
      t.integer :phno

      t.timestamps null: false
    end
  end
end
