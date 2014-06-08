class Api::V1::CashFlowsController < ApplicationController
  def create
    account = Account.find(params[:account_id])

    cash_flow = account.cash_flows.build(cash_flow_params)
    cash_flow.save

    response.status   = :created
    response.location = api_v1_account_cash_flow_path(account, cash_flow)
  end

  private

    def cash_flow_params
      params.require(:cash_flow).permit(:description, :date, :payee, :amount)
    end
end
