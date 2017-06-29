class CalculatorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home; end

  def evaluate
    return render json: { message: 'Unknown Expression Type.', error: 'Unknown Expression Type.' }, status: 422 if params[:expression_type].blank?
    expression = case params[:expression_type]
                 when 'RPN'
                   RpnExpression.new(expression_params)
                 end
    expression.result = expression.evaluate
    return render json: { message: 'Something went wrong saving the expression', error: expression.errors }, status: 422 unless expression.save
    render json: { message: 'Successfully calculated', result: expression.result }, status: :ok
  rescue ZeroDivisionError => e
    return render json: { message: 'You cannot divide a finite number by zero.', error: e }, status: 422
  rescue NotImplementedError => e
    return render json: { message: "#{e.message.capitalize} operation is coming soon!", error: "#{e.message.capitalize} operation is coming soon!" }, status: 422
  rescue SyntaxError
    return render json: { message: "Expression is not valid", error: "Expression is not valid" }, status: 422
  rescue => e
    return render json: { message: 'Something went wrong saving the expression', error: e }, status: 422
  end

  private

  def expression_params
    {
      expression: params[:expression]
    }
  end
end
