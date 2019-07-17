# frozen_string_literal: true

RSpec.describe Viglink do
  subject { described_class.configuration }

  let(:default_attributes) do
    {
      api_key: ENV['VIGLINK_API_KEY'],
      secret_key: ENV['VIGLINK_SECRET_KEY']
    }
  end

  it 'has a version number' do
    expect(Viglink::VERSION).not_to be nil
  end

  describe '.configuration' do
    context 'when there is no previous configuration' do
      it { is_expected.to have_attributes(default_attributes) }
    end

    context 'with a previous configured instance' do
      before do
        described_class.configure do |config|
          config.api_key = '123'
          config.secret_key = '456'
        end
      end

      it { is_expected.to have_attributes(api_key: '123', secret_key: '456') }
    end
  end

  describe '.configure' do
    before do
      described_class.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end
    end

    it { is_expected.to have_attributes(api_key: '123', secret_key: '456') }
  end

  describe '.reset' do
    before do
      described_class.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end
      described_class.reset
    end

    it { is_expected.to have_attributes(default_attributes) }
  end
end
