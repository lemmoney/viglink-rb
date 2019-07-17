# frozen_string_literal: true

RSpec.describe Viglink::IndustryType do
  describe '.initialize(code:, name:)' do
    subject { described_class.new(attributes) }

    let(:attributes) { { code: 'CE', name: 'Consumer Electronics' } }

    it { is_expected.to have_attributes(attributes) }
  end
end
