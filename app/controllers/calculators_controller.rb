class CalculatorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def home
  end

  def calculate
    if params[:expression_type] == "RPN"
      expression = RpnExpression.new(expression_params)
    end
    expression.result = expression.evaluate
    if expression.save
      # TODO: need to update expression's result.
      return render json: { message: "Successfully calculated", result: expression.result }, status: :ok
    else
      return render json: { message: "Something went wrong saving the expression", error: expression.errors }, status: :unprocessible_entity
    end

  end

  private

  def expression_params
    {
      expression: params[:expression]
    }
  end
end
