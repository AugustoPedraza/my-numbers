class Api::V1::AccountsController < ApplicationController
  def index
    render json: Account.all
  end

  def show
    begin
      render json: Account.includes(:cash_flows).find(params[:id]), include: :cash_flows
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end
end
