json.array!(@notification_lists) do |notification_list|
  json.extract! notification_list, :id, :name, :email, :phno
  json.url notification_list_url(notification_list, format: :json)
end
