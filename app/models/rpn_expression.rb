class RpnExpression < ApplicationRecord
  include ApplicationHelper

  validate :expression, :presence
  validate :result, :presence

  def evaluate
    @terminal_stack = Stack.new
    terminals = expression.split(' ')

    terminals.each do |terminal|
      if is_number?(terminal)
        @terminal_stack.push(terminal)
      elsif terminal == '+'
        parse_addition
      elsif terminal == '-'
        parse_subtraction
      elsif terminal == '*'
        parse_multiplication
      elsif terminal == '/'
        parse_division
      end
    end
    @terminal_stack.pop
  end

  private

  def parse_addition
    second_terminal = @terminal_stack.pop
    first_terminal = @terminal_stack.pop
    @terminal_stack.push(first_terminal.to_f + second_terminal.to_f)
  end

  def parse_subtraction
    second_terminal = @terminal_stack.pop
    first_terminal = @terminal_stack.pop
    @terminal_stack.push(first_terminal.to_f - second_terminal.to_f)
  end

  def parse_multiplication
    second_terminal = @terminal_stack.pop
    first_terminal = @terminal_stack.pop
    @terminal_stack.push(first_terminal.to_f * second_terminal.to_f)
  end

  def parse_division
    second_terminal = @terminal_stack.pop
    first_terminal = @terminal_stack.pop
    raise ZeroDivisionError if second_terminal.to_f.zero?
    @terminal_stack.push(first_terminal.to_f / second_terminal.to_f)
  end
end
