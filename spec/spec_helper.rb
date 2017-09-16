require "bundler/setup"
require "tout"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.extend(Tout)

  config.before(:suite) do
    puts "\nPlease note: This test suite is supposed to have two passing specs and three failing specs."
  end
end
