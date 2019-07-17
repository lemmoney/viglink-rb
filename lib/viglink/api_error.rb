# frozen_string_literal: true

module Viglink
  class APIError < StandardError
    attr_reader :status, :body

    def initialize(status:, body:)
      @status = status
      @body = body
    end
  end
end
