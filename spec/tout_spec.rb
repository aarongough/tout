require "spec_helper"

class NormalClass
  def public_foo
    "public"
  end

  private

  def private_foo
    "private"
  end
end

RSpec.describe Tout do
  describe "#publicize" do

    after(:all) do
      raise "Method privacy was not restored" if NormalClass.method_defined?(:private_foo)
    end

    context "for a private method" do
      publicize(NormalClass, :private_foo)

      it "makes the method public" do
        expect(NormalClass.new.private_foo).to eq("private")
      end
    end

    context "raises an error when given a public method" do
      publicize(NormalClass, :public_foo)

      it "raises an error" do
        flunk
      end
    end

    context "raises an error when given a method that does not exist" do
      publicize(NormalClass, :foo)

      it "raises an error" do
        flunk
      end
    end
  end
end
