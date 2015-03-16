class AddColumnMacIdToRouterStatus < ActiveRecord::Migration
  def change
    add_column :router_statuses, :macid, :string
  end
end
