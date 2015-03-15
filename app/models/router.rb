class Router < ActiveRecord::Base
  belongs_to :store
  has_and_belongs_to_many :packages
  has_many :router_statuses

  scope :get_routers, -> {
    #includes(:router_statuses).where(router_statuses: {created_at: 5.minutes.ago})
    joins("left outer join router_statuses on router_statuses.router_id = routers.id and router_statuses.created_at > '#{5.minutes.ago}'")
  }

  def get_status
    self.router_status

  end
end
