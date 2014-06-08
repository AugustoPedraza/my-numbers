class Api::V1::CashFlowsController < ApplicationController
  def create
    account = Account.find(params[:account_id])

    cash_flow = account.cash_flows.build(params[:cash_flow])
    cash_flow.save

    response.status   = :created
    response.location = api_v1_account_cash_flow_path(account, cash_flow)
  end
end
