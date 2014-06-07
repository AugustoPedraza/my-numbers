class Api::V1::CashFlowsController < ApplicationController
  def create
    account = Account.find(params[:account_id])

    account.cash_flows.build(params[:cash_flow])

    account.save
  end
end
