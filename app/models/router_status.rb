class RouterStatus < ActiveRecord::Base
  belongs_to :router
  scope :status_display, -> {
    where (
              "id in (select max(id) from router_statuses group by router_id)"
          )
  }

  scope :get_latest, -> {
    where( :status => 1  ).first
  }

end
