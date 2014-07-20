class RenameCashFlowsTable < ActiveRecord::Migration
  def change
    rename_table :cash_flows, :expenses
  end
end
