class CashFlow < ActiveRecord::Base
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true
  validates :date, presence: true
  validates :description, presence: true

end
