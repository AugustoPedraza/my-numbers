class Account < ActiveRecord::Base
  has_many :expenses

  validates :name, presence: true, uniqueness: true

  def current_balance
    expenses.sum(:amount)
  end
end
