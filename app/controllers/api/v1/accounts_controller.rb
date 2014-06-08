class Api::V1::AccountsController < ApplicationController
  def index
    @accounts = Account.all
    # render
    respond_with @accounts
  end

  def show
    begin
      @account = Account.includes(:cash_flows).find(params[:id])

      render
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end
end
