require 'spec_helper'

describe Api::V1::CashFlowsController, type: :controller do
  describe ".create" do
    context 'with valid attributes' do
      it "create a new cash flow" do
        cash_flow_double = double(CashFlow)
        allow(cash_flow_double).to receive(:save).and_return(true)
        allow(cash_flow_double).to receive(:to_param).and_return(1)

        account_double  = double(Account)
        allow(account_double).to receive(:to_param).and_return(33)
        allow(account_double).to receive_message_chain(:cash_flows, :build).and_return(cash_flow_double)


        Account.stub(:find).with("33").and_return(account_double)

        cash_flow_json = { :amount => 33.66, date: DateTime.now, description: 'fake description' }

        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json

        expect(account_double.cash_flows).to have_received(:build).with(cash_flow_json)
        expect(cash_flow_double).to have_received(:save)
      end

      it "return created resource code" do
        cash_flow_double = double(CashFlow)
        allow(cash_flow_double).to receive(:save).and_return(true)
        allow(cash_flow_double).to receive(:to_param).and_return(1)

        account_double  = double(Account)
        allow(account_double).to receive(:to_param).and_return(33)

        allow(account_double).to receive_message_chain(:cash_flows, :build).and_return(cash_flow_double)


        Account.stub(:find).with("33").and_return(account_double)

        cash_flow_json = { :amount => 33.66, date: DateTime.now, description: 'fake description' }

        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json

        expect(response).to have_http_status(:created)
      end

      it "return location for new created resource" do
        cash_flow_double = double(CashFlow)
        allow(cash_flow_double).to receive(:save).and_return(true)
        allow(cash_flow_double).to receive(:to_param).and_return(1)

        account_double  = double(Account)
        allow(account_double).to receive(:to_param).and_return(33)

        allow(account_double).to receive_message_chain(:cash_flows, :build).and_return(cash_flow_double)


        Account.stub(:find).with("33").and_return(account_double)

        cash_flow_json = { :amount => 33.66, date: DateTime.now, description: 'fake description' }

        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json

        expect(response.location).to eql('/api/v1/accounts/33/cash_flows/1')
      end
    end
  end
end

