class AddPayeeToCashFlow < ActiveRecord::Migration
  def change
    add_column :cash_flows, :payee, :string, null: false, default: 'PUT SOME VALID'
  end
end
