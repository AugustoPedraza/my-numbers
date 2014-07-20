class Account < ActiveRecord::Base
  has_many :expenses

  validates :name, presence: true, uniqueness: true

  def current_balance
    cash_flows.sum(:amount)
  end
end
