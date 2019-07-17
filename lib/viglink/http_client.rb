# frozen_string_literal: true

require 'httparty'

module Viglink
  class HTTPClient
    include HTTParty
    base_uri 'https://publishers.viglink.com'
    headers Authorization: -> { "secret #{Viglink.configuration.secret_key}" }
    # format :json
    debug_output Viglink.configuration.debug_output

    def self.get(path:, query: {})
      response = super(path, query: query)

      unless response.success?
        raise Viglink::APIError.new(status: response.code, body: response.body)
      end

      response
    end
  end
end
