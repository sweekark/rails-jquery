class AddTimestampstoRouterStatus < ActiveRecord::Migration
  def change
    add_timestamps(:router_statuses)
  end
end
