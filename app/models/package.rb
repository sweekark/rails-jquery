class Package < ActiveRecord::Base
  enum os: [:android, :ios, :windows]
  mount_uploader :avatar, AvatarUploader
  has_and_belongs_to_many :routers
end
