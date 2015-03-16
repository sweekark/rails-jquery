json.array!(@router_statuses) do |router_status|
  json.extract! router_status, :id, :router_id, :macid, :status
  json.url router_status_url(router_status, format: :json)
end
