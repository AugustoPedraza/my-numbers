require 'spec_helper'

describe CashFlow do
  it { expect(subject).to belong_to :account }
  it { expect(subject).to validate_presence_of :account }
  it { expect(subject).to validate_presence_of :amount }
  it { expect(subject).to validate_presence_of :date }
  it { expect(subject).to validate_presence_of :description }
  it { expect(subject).to validate_presence_of :payee }
end
