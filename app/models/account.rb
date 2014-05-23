class Account < ActiveRecord::Base
  has_many :cash_flows

  validates :name, presence: true, uniqueness: true

  def current_balance
    cash_flows.sum(:amount)
  end
end
