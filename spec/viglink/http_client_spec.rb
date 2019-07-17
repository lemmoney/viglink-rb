# frozen_string_literal: true

RSpec.describe Viglink::HTTPClient, :vcr do
  describe 'get(path:, query: {})' do
    context 'when response succeced' do
      it 'returns an response object' do
        expect(described_class.get(path: '/')).to be_success
      end
    end

    context 'when response fail' do
      before do
        Viglink.configuration.secret_key = nil
      end

      after do
        Viglink.configuration.secret_key = ENV['VIGLINK_SECRET_KEY']
      end

      it 'raises APIError' do
        expect do
          described_class.get(path: '/api/merchant/search')
        end.to raise_error(Viglink::APIError)
      end
    end
  end
end
