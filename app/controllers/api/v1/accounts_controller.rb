class Api::V1::AccountsController < ApplicationController
  def index
    @accounts = Account.all
    render
  end

  def show
    begin
      @account = Account.includes(:expenses).find(params[:id])

      render
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end
end
