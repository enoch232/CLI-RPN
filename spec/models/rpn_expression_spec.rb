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

      it 'raises ZeroDivisionError when dividing by zero' do
        rpn_expression = RpnExpression.new(expression: '5 0 /')
        expect { rpn_expression.evaluate }.to raise_error(ZeroDivisionError)
      end
    end

    context 'when evaluating modulo' do
      it 'raises NotImplementedError' do
        rpn_expression = RpnExpression.new(expression: '5 2 %')
        expect { rpn_expression.evaluate }.to raise_error(NotImplementedError)
      end
    end

    context 'when evaluating power' do
      it 'raises NotImplementedError' do
        rpn_expression = RpnExpression.new(expression: '5 2 **')
        expect { rpn_expression.evaluate }.to raise_error(NotImplementedError)
      end
    end

    context 'when input is invalid' do
      context 'with & operation' do
        it 'raises SyntaxError' do
          rpn_expression = RpnExpression.new(expression: '5 2 &')
          expect { rpn_expression.evaluate }.to raise_error(SyntaxError)
        end
      end

      context 'with unsupported characters' do
        it 'raises SyntaxError' do
          rpn_expression = RpnExpression.new(expression: 'hello')
          expect { rpn_expression.evaluate }.to raise_error(SyntaxError)
        end
      end
    end
  end
end
