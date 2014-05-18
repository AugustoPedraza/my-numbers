class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name,  null: false
      t.float :initial_balance, default: 0, null: false

      t.index :name, unique: true
      t.timestamps
    end
  end
end
