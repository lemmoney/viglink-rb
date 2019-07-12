# frozen_string_literal: true

RSpec.describe Viglink do
  subject(:configuration) { described_class.configuration }

  it 'has a version number' do
    expect(Viglink::VERSION).not_to be nil
  end

  describe '.configuration' do
    context 'when there is no previous configuration' do
      it 'api_key must be null' do
        expect(configuration.api_key).to be_nil
      end

      it 'secret_key must be null' do
        expect(configuration.secret_key).to be_nil
      end
    end

    context 'with a previous configured instance' do
      before do
        described_class.configure do |config|
          config.api_key = '123'
          config.secret_key = '456'
        end
      end

      it 'preserves api_key' do
        expect(configuration.api_key).to eq('123')
      end

      it 'preserves secret_key' do
        expect(configuration.secret_key).to eq('456')
      end
    end
  end

  describe '.configure' do
    before do
      described_class.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end
    end

    it 'sets api_key' do
      expect(configuration.api_key).to eq('123')
    end

    it 'sets secret_key' do
      expect(configuration.secret_key).to eq('456')
    end
  end

  describe '.reset' do
    before do
      described_class.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end
      described_class.reset
    end

    it 'sets api_key to nil' do
      expect(configuration.api_key).to be_nil
    end

    it 'sets secret_key to nil' do
      expect(configuration.secret_key).to be_nil
    end
  end
end
