class CalculatorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def home
  end

  def evaluate
    expression = case params[:expression_type]
    when "RPN"
      RpnExpression.new(expression_params)
    else
      RpnExpression.new(expression_params)
    end
    expression.result = expression.evaluate
    return render json: { message: "Something went wrong saving the expression", error: expression.errors }, status: :unprocessible_entity unless expression.save
    render json: { message: "Successfully calculated", result: expression.result }, status: :ok
    rescue ZeroDivisionError => e
      return render json: { message: "You cannot divide a finite number by zero.", error: e }, status: :unprocessible_entity
    rescue => e
      return render json: { message: "Something went wrong saving the expression", error: e }, status: :unprocessible_entity
  end

  private

  def expression_params
    {
      expression: params[:expression]
    }
  end
end
