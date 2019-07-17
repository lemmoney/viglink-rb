# frozen_string_literal: true

RSpec.describe Viglink::APIError do
  describe '.initialize(status:, body:)' do
    subject { described_class.new(status: 401, body: 'Unauthorized') }

    it { is_expected.to have_attributes(status: 401, body: 'Unauthorized') }
  end
end
