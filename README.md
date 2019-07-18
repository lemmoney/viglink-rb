# VigLink Ruby
[![Gem Version](https://badge.fury.io/rb/viglink-rb.svg)](https://rubygems.org/gems/viglink-rb) [![Build Status](https://travis-ci.com/lemmoney/viglink-rb.svg?token=kGJtMxwzFwua1ty5npNb&branch=master)](https://travis-ci.com/lemmoney/viglink-rb)

Wrapper for the VigLink API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'viglink-rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install viglink-rb

## Usage

```
require 'viglink'

Viglink.configure do |config|
  config.secret_key = ENV['VIGLINK_SECRET_KEY']
  config.api_key = ENV['VIGLINK_API_KEY']
end

Viglink::Merchant.search page: 1
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lemmoney/viglink-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
