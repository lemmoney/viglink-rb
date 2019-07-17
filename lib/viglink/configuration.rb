# frozen_string_literal: true

module Viglink
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end

  class Configuration
    attr_accessor :api_key, :secret_key, :debug_output

    def initialize(api_key: ENV['VIGLINK_API_KEY'],
                   secret_key: ENV['VIGLINK_SECRET_KEY'],
                   debug_output: false)
      @api_key = api_key
      @secret_key = secret_key
      @debug_output = debug_output
    end
  end
end
