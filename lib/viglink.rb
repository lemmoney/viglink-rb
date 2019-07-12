# frozen_string_literal: true

require 'viglink/configuration'
require 'viglink/version'

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
end
