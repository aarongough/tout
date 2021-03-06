require "tout/version"

module Tout
  def publicize(klass, method)
    method_already_public = klass.method_defined?(method)
    private_method_defined = klass.private_method_defined?(method)

    before(:each) do
      raise "Cannot publicize #{klass.name}##{method} as it is already public." if method_already_public
      raise "Cannot publicize #{klass.name}##{method} no private method by that name exists." unless private_method_defined

      klass.send(:public, method) if private_method_defined && !method_already_public
    end

    after(:each) do
      klass.send(:private, method) if private_method_defined && !method_already_public
    end
  end
end