class AddRouterIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :route_id, :integer
  end
end
