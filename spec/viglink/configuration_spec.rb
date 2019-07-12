# frozen_string_literal: true

RSpec.describe Viglink::Configuration do
  describe '.initialize(api_key:, secret_key:)' do
    it 'sets api_key' do
      config = described_class.new(api_key: '123')
      expect(config.api_key).to eq('123')
    end

    it 'sets secret_key' do
      config = described_class.new(secret_key: '456')
      expect(config.secret_key).to eq('456')
    end

    it 'allows to initialize without keys' do
      expect { described_class.new }.not_to raise_error
    end
  end
end
