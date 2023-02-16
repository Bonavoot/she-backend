class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    wrap_parameters format: []
    before_action :authorize
    include ActionController::Cookies

    private

    def render_record_not_found_response(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    # helper method to keep track of current user
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def authorize
        render json: {errors: ["Not authorized"]}, status: :unauthorized unless current_user
    end
    
end 
