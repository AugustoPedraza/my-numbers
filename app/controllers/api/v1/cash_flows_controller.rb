class Api::V1::CashFlowsController < ApplicationController
  def create
    begin
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

        response.status = :unprocessable_entity
        render json: errors
      end
    rescue ActiveRecord::RecordNotFound => e
      response.status = :not_found
      render json: "Account not found"
    end

  end

  private

    def cash_flow_params
      params.require(:cash_flow).permit(:description, :date, :payee, :amount)
    end
end
