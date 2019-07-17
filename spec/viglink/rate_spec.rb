# frozen_string_literal: true

RSpec.describe Viglink::Rate do
  describe ".initialize(min: nil,
                        max: nil,
                        type: '',
                        type_name: '',
                        description: '')" do
    subject do
      described_class.new attributes
    end

    let(:attributes) do
      { min: 1,
        max: 7,
        type: '%',
        type_name: '%',
        description: 'Calculated Rate' }
    end

    it { is_expected.to have_attributes(attributes) }
  end

  describe '.from_json(hash = {})' do
    subject { described_class.from_json(json_hash) }

    let(:json_hash) do
      {
        'min' => 7.71,
        'max' => 7.71,
        'type' => '%',
        'description' => 'Calculated Rate',
        'typeName' => '%'
      }
    end
    let(:json_attributes) do
      { min: 7.71,
        max: 7.71,
        type: '%',
        type_name: '%',
        description: 'Calculated Rate' }
    end

    it { is_expected.to have_attributes(json_attributes) }
  end
end
