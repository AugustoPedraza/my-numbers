json.extract! @account, :id, :name, :current_balance, :expenses

json.expenses @account.expenses do |expense|
  json.extract! expense, :id, :date, :amount, :description
end
