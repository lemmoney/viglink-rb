# frozen_string_literal: true

module Viglink
  IndustryType = Struct.new(:code, :name, keyword_init: true) do
    def self.from_json(industry_type)
      new code: industry_type['code'], name: industry_type['name']
    end
  end
end
