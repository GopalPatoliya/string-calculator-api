class CalculationsController < ApplicationController
  def create
    input = params[:input].to_s

    begin
      result = StringCalculator.add(input)
      render json: { result: result }
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
