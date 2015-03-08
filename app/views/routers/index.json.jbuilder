json.array!(@routers) do |router|
  json.extract! router, :id, :name, :macid
  json.url router_url(router, format: :json)
end
