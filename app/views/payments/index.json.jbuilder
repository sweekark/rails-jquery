json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :cardType, :amountReceived
  json.url payment_url(payment, format: :json)
end
