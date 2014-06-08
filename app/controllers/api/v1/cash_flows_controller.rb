class Api::V1::CashFlowsController < ApplicationController
  def create
    account = Account.find(params[:account_id])
    cash_flow = account.cash_flows.build(cash_flow_params)

    if cash_flow.save
      response.status   = :created
      response.location = api_v1_account_cash_flow_path(account, cash_flow)
    else
      errors = {}

      cash_flow.errors.keys.each do |attr|
        errors[attr] = cash_flow.errors.full_messages_for(attr)
      end

      render json: errors
    end
  end

  private

    def cash_flow_params
      params.require(:cash_flow).permit(:description, :date, :payee, :amount)
    end
end
