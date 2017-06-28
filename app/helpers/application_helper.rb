module ApplicationHelper
  def number?(string)
    true if Float(string) rescue false
  end
end
