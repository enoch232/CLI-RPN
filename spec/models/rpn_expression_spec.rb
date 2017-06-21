require 'rails_helper'

describe RpnExpression, type: :model do
  describe '.evaluate' do
    context "when calculating addition" do
      it "evaluates correctly" do
        rpn_expression = RpnExpression.new( { expression: "5 2 +" } )
        expect(rpn_expression.evaluate).to eq(7)
      end
    end

    context "when calculating subtraction" do
      it "evaluates correctly" do
        rpn_expression = RpnExpression.new( { expression: "5 2 -" } )
        expect(rpn_expression.evaluate).to eq(3)
      end
    end

    context "when calculating multiplication" do
      it "evaluates correctly" do
        rpn_expression = RpnExpression.new( { expression: "5 2 *" } )
        expect(rpn_expression.evaluate).to eq(10)
      end
    end

    context "when calculating division" do
      it "evaluates correctly" do
        rpn_expression = RpnExpression.new( { expression: "5 2 /" } )
        expect(rpn_expression.evaluate).to eq(5.0/2.0)
      end
    end
  end
end
