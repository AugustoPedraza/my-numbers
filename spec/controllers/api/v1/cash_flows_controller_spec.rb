require 'spec_helper'

describe Api::V1::CashFlowsController, type: :controller do
  describe ".create" do
    context 'with valid attributes' do
      let(:cash_flow_double) do
        obj = double(CashFlow)
        allow(obj).to receive(:save).and_return(true)
        allow(obj).to receive(:to_param).and_return(1)

        obj
      end

      let(:account_double) do
        obj  = double(Account)
        allow(obj).to receive(:to_param).and_return(33)
        allow(obj).to receive_message_chain(:cash_flows, :build).and_return(cash_flow_double)

        obj
      end

      let(:cash_flow_json) do
        {
          :amount => 33.66,
          date: DateTime.now,
          description: 'fake description'
        }
      end

      before(:each) do
        Account.stub(:find).with("33").and_return(account_double)
        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json
      end

      it "create a new cash flow" do
        expect(cash_flow_double).to have_received(:save)
      end

      it "return created resource code" do
        expect(response).to have_http_status(:created)
      end

      it "return location for new created resource" do
        expect(response.location).to eql('/api/v1/accounts/33/cash_flows/1')
      end
    end
  end
end

