class RpnExpression < ApplicationRecord
  validate :expression, :presence
  validate :result, :presence

  def evaluate
    @terminal_stack = Stack.new
    raise SyntaxError if expression.empty?
    terminals = expression.split(' ')

    terminals.each do |terminal|
      if number?(terminal)
        @terminal_stack.push(terminal)
      elsif terminal == '+'
        parse_addition
      elsif terminal == '-'
        parse_subtraction
      elsif terminal == '*'
        parse_multiplication
      elsif terminal == '/'
        parse_division
      elsif terminal == '%'
        parse_modulo
      elsif terminal == '**'
        parse_power
      else
        raise SyntaxError
      end
    end
    @terminal_stack.pop
  end

  private

  def number?(string)
    true if Float(string) rescue false
  end

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

  def parse_modulo
    raise NotImplementedError, "modulo"
  end

  def parse_power
    raise NotImplementedError, "power"
  end
end
