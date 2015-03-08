class CreatePackagesRouter < ActiveRecord::Migration
  def change
    create_table :packages_routers do |t|
      t.belongs_to :router, index: true
      t.belongs_to :package, index: true
    end
  end
end
