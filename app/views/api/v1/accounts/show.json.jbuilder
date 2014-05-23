json.extract! @account, :id, :name, :cash_flows

json.cash_flows @account.cash_flows do |cash_flow|
  json.extract! cash_flow, :id, :date, :amount, :description
end
