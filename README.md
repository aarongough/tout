# Tout

Tout is a small helper for altering the visibility of methods while testing them. This allows classes to be structured with normal public/private methods while still maintaining full test coverage.

Tout allows a private method to be made public only for the duration of the test group, it sets the method back to private at the end of the example group to avoid any possible side effects.

## Usage

Tout allows the easy and safe testing of private methods via the `publicize` helper like so:

```ruby
publicize(class, :method_name)
```

Here it is in use in a small test suite:

```ruby
class NormalClass
  def public_foo
    "public"
  end

  private

  def private_foo
    "private"
  end
end

describe NormalClass do
  describe "#private_foo"
    publicize(described_class, :private_foo)

    it "returns 'private'" do
      expect(described_class.private_foo).to eq("private")
    end
  end  
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tout'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tout

After the gem is installed setup Tout in your RSpec config like so:

```ruby
RSpec.configure do |config|
  config.extend(Tout)
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

