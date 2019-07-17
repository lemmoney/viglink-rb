# frozen_string_literal: true

RSpec.describe Viglink::Configuration do
  describe '.initialize(api_key:, secret_key:)' do
    context 'with values' do
      subject { described_class.new(api_key: '123', secret_key: '456') }

      it { is_expected.to have_attributes(api_key: '123', secret_key: '456') }
    end

    context 'with defaul values' do
      let(:default_attributes) do
        {
          api_key: ENV['VIGLINK_API_KEY'],
          secret_key: ENV['VIGLINK_SECRET_KEY']
        }
      end

      it { is_expected.to have_attributes(default_attributes) }
    end
  end
end
