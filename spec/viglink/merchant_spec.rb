# frozen_string_literal: true

RSpec.describe Viglink::Merchant do
  before do
    Viglink.configure do |config|
      config.secret_key = ENV['VIGLINK_SECRET_KEY']
      config.api_key = ENV['VIGLINK_API_KEY']
    end
  end

  after do
    Viglink.reset
  end

  let(:attributes) { attributes_for(:merchant) }

  describe '.initialize(**args)' do
    subject { described_class.new(attributes) }

    it { is_expected.to have_attributes(attributes) }
  end

  describe '.from_json(merchant = {})' do
    subject(:merchant) { described_class.from_json(merchant_data) }

    let(:merchant_data) do
      {
        'id' => 1, 'code' => 'b088c8bb32f4b1f906e333d751d238ce',
        'groupId' => 185, 'name' => 'Amazon US',
        'updateDate' => '2018-11-08', 'createDate' => '2009-01-01',
        'insider' => true,
        'industryTypes' => [{
          'code' => 'CE',
          'name' => 'Consumer Electronics'
        }],
        'affiliateCPA' => true, 'affiliateCPC' => false, 'approved' => false,
        'domains' => [
          'amazon.com', 'amazon.com.br'
        ],
        'countries' => 'us,br',
        'merchantSensitiveTypes' => [
          'Porn', 'Search Engines', 'Loyalty',
          'Toolbars', 'Charity', 'Link Shorteners', 'Coupon'
        ],
        'rates' => [{
          'min' => 7.71, 'max' => 7.71, 'type' => '%',
          'description' => 'Calculated Rate', 'typeName' => '%'
        }]
      }
    end

    before do
      # RSpec have_attributes does not work with nested objects
      attributes.delete(:industry_types)
      attributes.delete(:rates)
    end

    it { is_expected.to have_attributes(attributes) }

    it 'transform rates to objects' do
      expect(merchant.rates).to all(be_a_kind_of(Viglink::Rate))
    end

    it 'transform industry_types to objects' do
      expect(merchant.industry_types)
        .to all(be_a_kind_of(Viglink::IndustryType))
    end
  end
end
