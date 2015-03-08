class AddAvatarToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :avatar, :string
  end
end
