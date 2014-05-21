class Account < ActiveRecord::Base
  has_many :cash_flows

  validates :name, presence: true, uniqueness: true
end
