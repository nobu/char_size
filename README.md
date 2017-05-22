# CharSize

[![Gem Version](https://badge.fury.io/rb/char_size.svg)](http://github.com/haines/char_size/releases)
[![Build Status](https://travis-ci.org/haines/char_size.svg?branch=master)](https://travis-ci.org/haines/char_size)
[![Code Climate](https://codeclimate.com/github/haines/char_size/badges/gpa.svg)](https://codeclimate.com/github/haines/char_size)

Find an encoding's minimum and maximum character size.


## Installation

Add this line to your application's Gemfile:

```ruby
gem "char_size"
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install char_size
```


## Usage

```ruby
CharSize.min("UTF-8")    # => 1
CharSize.max("UTF-8")    # => 6
CharSize.minmax("UTF-8") # => [1, 6]
```

Like `Encoding.find`, methods take a string encoding name, or an instance of `Encoding`.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/haines/char_size. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
