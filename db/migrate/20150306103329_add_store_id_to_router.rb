class AddStoreIdToRouter < ActiveRecord::Migration
  def change
    add_column :routers, :store_id, :integer
  end
end
