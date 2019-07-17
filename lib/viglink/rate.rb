# frozen_string_literal: true

module Viglink
  Rate = Struct.new(:min, :max, :type, :type_name,
                    :description, keyword_init: true) do
    def self.from_json(rate)
      new min: rate['min'],
          max: rate['max'],
          type: rate['type'],
          type_name: rate['typeName'],
          description: rate['description']
    end
  end
end
