class Api::V1::AccountsController < ApplicationController
  def index
    render json: Account.all
  end
end
