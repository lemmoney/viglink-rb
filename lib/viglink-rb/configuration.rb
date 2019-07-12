module Viglink
  class Configuration
    attr_accessor :api_key, :secret_key

    def initialize(api_key: nil, secret_key: nil)
      @api_key = api_key
      @secret_key = secret_key
    end
  end
end