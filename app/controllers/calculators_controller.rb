class CalculatorsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def home
  end

  def evaluate
    begin
      expression = case params[:expression_type]
      when "RPN"
        RpnExpression.new(expression_params)
      end
      expression.result = expression.evaluate
    rescue => e
      return render json: { message: "Something went wrong saving the expression", error: e }, status: :unprocessible_entity
    end
    return render json: { message: "Something went wrong saving the expression", error: expression.errors }, status: :unprocessible_entity unless expression.save
    render json: { message: "Successfully calculated", result: expression.result }, status: :ok
  end

  private

  def expression_params
    {
      expression: params[:expression]
    }
  end
end
