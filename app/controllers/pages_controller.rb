# This class is used in order to allow guests visualize the home page

class PagesController < ApplicationController
  require 'securerandom'
  # Authentication is mandatory after visiting the home page
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_api_key, only: [:ai_request]

  def home
    @uuid = SecureRandom.uuid
  end

  def ai_request
    AiRequestJob.perform_later(ai_request_params, @api_key)
    render json: { message: 'AI request processed successfully' }
  end

  private

  def ai_request_params
    params.require(:ai_request).permit(:prompt, :ai_model, :uuid)
  end

  def set_api_key
    @api_key = Rails.application.credentials.openai[:api_key]
  end
end
