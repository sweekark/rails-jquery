class Router < ActiveRecord::Base
  belongs_to :store
  has_and_belongs_to_many :packages
end
