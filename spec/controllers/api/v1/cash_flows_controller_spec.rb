require 'spec_helper'

describe Api::V1::CashFlowsController, type: :controller do
  describe ".create" do
    let(:cash_flow_json) do
      {
        :amount => 33.66,
        date: DateTime.now,
        description: 'fake description'
      }
    end

    context 'with valid account id' do
      let(:account_double) do
        obj  = double(Account)
        allow(obj).to receive(:to_param).and_return(33)
        allow(obj).to receive_message_chain(:cash_flows, :build).and_return(cash_flow_double)

        obj
      end

      before(:each) do
        Account.stub(:find).with("33").and_return(account_double)
        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json
      end

      context 'with valid attributes' do
        let(:cash_flow_double) do
          obj = double(CashFlow)
          allow(obj).to receive(:save).and_return(true)
          allow(obj).to receive(:to_param).and_return(1)

          obj
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

        it "return a empty body" do
          expect(response.body).to eql("")
        end
      end

      context 'with invalid attributes' do
        let(:errors) do
          {
            :description => ["Description can't blank"],
            :amount => ["Amount can't be less than 0"],
            :payee => ["payee can't be blank", "other violated validation"]
          }
        end

        let(:cash_flow_double) do
          allow_message_expectations_on_nil

          obj = double(CashFlow)
          allow(obj).to receive(:save).and_return(false)
          allow(obj).to receive(:to_param).and_return(1)
          allow(obj).to receive(:errors)

          allow(obj).to receive_message_chain(:errors, :keys).and_return(errors.keys)

          errors.each_pair do |attr, values|
            obj.stub_chain(:errors, :full_messages_for).with(attr).and_return(values)
          end

          obj
        end

        describe "validations error" do
          it "return a json with all messages" do
            expected =
            {
              :description => ["Description can't blank"],
              :amount => ["Amount can't be less than 0"],
              :payee => ["payee can't be blank", "other violated validation"]
            }.to_json

            expect(response.body).to eql(expected)
          end

          it "return unprocessable entity reponse code" do
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
    end

    context 'with invalid account id' do
      before(:each) do
        Account.stub(:find).with("33").and_raise(ActiveRecord::RecordNotFound)
        post :create,  format: :json, :account_id => 33, cash_flow: cash_flow_json
      end

      context 'with invalid account' do
        it "return a body message" do
          expect(response.body).to eql("Account not found")
        end

        it "return 404 code" do
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end

