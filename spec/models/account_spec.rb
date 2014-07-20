require 'spec_helper'

describe Account do
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_uniqueness_of :name }
  it { expect(subject).to have_many :expenses }
end
