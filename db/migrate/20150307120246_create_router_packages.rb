class CreateRouterPackages < ActiveRecord::Migration
  def change
    create_table :router_packages do |t|
      t.belongs_to :router, index: true
      t.belongs_to :package, index: true
      t.timestamps null: false
    end
  end
end
