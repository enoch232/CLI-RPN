class CalculatorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def home
  end

  def calculate
    if calculation_params["expression_type"] == "RPN"
      expression = RpnExpression.new({ expression: calculation_params[:expression] })
    end

    if expression.save
      expression_result = expression.evaluate
      # TODO: need to update expression's result.
      return render json: { message: "Successfully calculated", result: expression_result }, status: :ok
    else
      return render json: { message: "Something went wrong saving the expression", error: expression.errors }, status: :unprocessible_entity
    end

  end

  private

  def calculation_params
    params.require(:calculation).permit(:expression, :expression_type)
  end
end
