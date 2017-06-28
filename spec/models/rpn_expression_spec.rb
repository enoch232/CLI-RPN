require 'rails_helper'

describe RpnExpression, type: :model do
  describe '.evaluate' do
    context 'when evaluating addition' do
      it 'evaluates correctly' do
        rpn_expression = RpnExpression.new(expression: '5 2 +')
        expect(rpn_expression.evaluate).to eq(7)
      end
    end

    context 'when evaluating subtraction' do
      it 'evaluates correctly' do
        rpn_expression = RpnExpression.new(expression: '5 2 -')
        expect(rpn_expression.evaluate).to eq(3)
      end
    end

    context 'when evaluating multiplication' do
      it 'evaluates correctly' do
        rpn_expression = RpnExpression.new(expression: '5 2 *')
        expect(rpn_expression.evaluate).to eq(10)
      end
    end

    context 'when evaluating division' do
      it 'evaluates correctly' do
        rpn_expression = RpnExpression.new(expression: '5 2 /')
        expect(rpn_expression.evaluate).to eq(5.0 / 2.0)
      end

      it 'returns error when dividing by zero' do
        rpn_expression = RpnExpression.new(expression: '5 0 /')
        expect { rpn_expression.evaluate }.to raise_error(ZeroDivisionError)
      end
    end
  end
end
