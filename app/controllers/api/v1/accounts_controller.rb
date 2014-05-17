class Api::V1::AccountsController < ApplicationController
  def index
    render json: [
      {
        id: 1,
        name: 'Sueldo convey',
        initialBalance: 0
      },
      {
        id: 2,
        name: 'Visa Credito Santander',
        initialBalance: -4500
      }
    ]
  end
end
