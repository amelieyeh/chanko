require "spec_helper"

module Chanko
  module Unit
    describe Extender do
      before do
        stub_const("ExampleClass", Class.new)
      end

      it "extends instance methods" do
        Extender.new.expand(:ExampleClass) do
          def test
            "test"
          end
        end
        expect(ExampleClass.new.test).to eq("test")
      end

      it "extends class methods" do
        Extender.new.expand(:ExampleClass) do
          class_methods do
            def test
              "test"
            end
          end
        end
        expect(ExampleClass.test).to eq("test")
      end

      it "extends instance methods with prefix" do
        Extender.new("__prefix_").expand(:ExampleClass) do
          def test
            "test"
          end
        end
        expect(ExampleClass.new.__prefix_test).to eq("test")
      end
    end
  end
end
