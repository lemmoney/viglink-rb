RSpec.describe Viglink do
  it 'has a version number' do
    expect(Viglink::VERSION).not_to be nil
  end

  describe '.configuration' do
    context 'when there is no previous configuration' do
      it 'returns a new configuration' do
        expect(subject.configuration.api_key).to be_nil
        expect(subject.configuration.secret_key).to be_nil
      end
    end

    context 'with a previous configured instance' do
      before do
        subject.configure do |config|
          config.api_key = '123'
          config.secret_key = '456'
        end
      end
      it 'returns previous configuration' do
        expect(subject.configuration.api_key).to eq('123')
        expect(subject.configuration.secret_key).to eq('456')
      end
    end
  end

  describe '.configure' do
    it 'allows to set configuration values' do
      subject.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end

      expect(subject.configuration.api_key).to eq('123')
      expect(subject.configuration.secret_key).to eq('456')
    end
  end

  describe '.reset' do
    it 'reset configuration values to default values' do
      subject.configure do |config|
        config.api_key = '123'
        config.secret_key = '456'
      end
      subject.reset
      expect(subject.configuration.api_key).to be_nil
      expect(subject.configuration.secret_key).to be_nil
    end
  end
end
