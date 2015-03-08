class CreateTableRouterStatus < ActiveRecord::Migration
  def change
    create_table :router_statuses do |t|
      t.integer :router_id
      t.integer :status
      t.date :time
    end
  end
end
