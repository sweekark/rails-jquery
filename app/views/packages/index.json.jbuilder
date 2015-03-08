json.array!(@packages) do |package|
  json.extract! package, :id, :name, :type
  json.url package_url(package, format: :json)
end
