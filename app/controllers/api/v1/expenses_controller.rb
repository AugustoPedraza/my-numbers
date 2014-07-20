class Api::V1::ExpensesController < ApplicationController
  def create
    begin
      account = Account.find(params[:account_id])
      expense = account.expenses.build(expenses_params)

      if expense.save
        response.status   = :created
        response.location = api_v1_account_expense_path(account, expense)
      else
        errors = {}

        expense.errors.keys.each do |attr|
          errors[attr] = expense.errors.full_messages_for(attr)
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

    def expenses_params
      params.require(:expense).permit(:description, :date, :payee, :amount)
    end
end
