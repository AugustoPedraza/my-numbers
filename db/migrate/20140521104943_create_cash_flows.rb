class CreateCashFlows < ActiveRecord::Migration
  def change
    create_table :cash_flows do |t|
      t.string :description,  null: false
      t.date :date,  null: false
      t.float :amount,  null: false
      t.belongs_to :account, index: true,  null: false

      t.timestamps
    end
  end
end
