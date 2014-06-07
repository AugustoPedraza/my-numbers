require 'spec_helper'

describe Api::V1::CashFlowsController, type: :controller do
  describe ".create" do
    context 'with valid attributes' do
      it "create a new cash flow" do
        account_double  = double(Account)
        allow(account_double).to receive_message_chain(:cash_flows, :build)
        allow(account_double).to receive(:save).and_return(true)

        Account.stub(:find).with("33").and_return(account_double)

        cash_flow_json = { :amount => 33.66, date: DateTime.now, description: 'fake description' }

        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json

        expect(account_double.cash_flows).to have_received(:build).with(cash_flow_json)
        expect(account_double).to have_received(:save)
      end
      it "return created resource code"
    end
  end
end

