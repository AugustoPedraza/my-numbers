class Api::V1::BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
    render
  end
end
