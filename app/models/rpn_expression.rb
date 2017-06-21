class RpnExpression < ApplicationRecord
  include ApplicationHelper
  validate :expression, :presence
  validate :result, :presence

  def evaluate
    terminal_stack = Stack.new
    terminals = expression.split(" ")

    terminals.each do |terminal|
      if is_number?(terminal)
        terminal_stack.push(terminal)
      elsif terminal == "+"
        second_terminal = terminal_stack.pop
        first_terminal = terminal_stack.pop
        terminal_stack.push(first_terminal.to_f + second_terminal.to_f)
      elsif terminal == "-"
        second_terminal = terminal_stack.pop
        first_terminal = terminal_stack.pop
        terminal_stack.push(first_terminal.to_f - second_terminal.to_f)
      elsif terminal == "*"
        second_terminal = terminal_stack.pop
        first_terminal = terminal_stack.pop
        terminal_stack.push(first_terminal.to_f * second_terminal.to_f)
      elsif terminal == "/"
        second_terminal = terminal_stack.pop
        first_terminal = terminal_stack.pop
        terminal_stack.push(first_terminal.to_f / second_terminal.to_f)
      end
    end
    terminal_stack.pop
  end

end
