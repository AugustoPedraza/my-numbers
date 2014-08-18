class Expense < ActiveRecord::Base
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, less_than: 0 }
  validates :date, presence: true
  validates :description, presence: true
  validates :payee, presence: true

end
