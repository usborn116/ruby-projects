require './lib/calculator'
describe Calculator do
    describe "#add" do
      it "returns the sum of two numbers" do
        calculator = Calculator.new
        expect(calculator.add(5, 2)).to eql(7)
      end

      it "returns the sum of more than two numbers" do
        calculator = Calculator.new
        expect(calculator.add(2,5,7)).to eql(14)
      end
    end

    describe "#subtract" do
      it "returns the difference between two numbers" do
        calculator = Calculator.new
        expect(calculator.subtract(5, 2)).to eql(3)
      end
    end
  end