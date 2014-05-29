class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string  :name,        null: false
      t.decimal :amount,      default: 0, null: false
      t.date    :start_date,  null: false
      t.date    :end_date,    null: false
      t.string  :description

      t.timestamps
    end
  end
end
