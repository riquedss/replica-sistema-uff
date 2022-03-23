class ApplicationController < ActionController::API
    def current_user
        return nil if !auth_token || !decoded_payload
        User.find_by(id: decoded_payload[0]["user_id"])
    end

    def verify_authenticated
        render json: { message: "You are not authenticated!" }, status: 401 and return unless current_user
    end

    def verify_director_authenticated
        render json: { message: "Permission denied" }, status: 403 and return unless current_user.director?      
    end

    def verify_dept_coord_authenticated
        render json: { message: "Permission denied" }, status: 403 and return unless current_user.department_coordinator?      
    end

    def verify_course_coord_authenticated
        render json: { message: "Permission denied" }, status: 403 and return unless current_user.course_coordinator?      
    end

    def verify_admin_authenticated
        render json: { message: "Permission denied" }, status: 403 and return unless current_user.admin?      
    end

    def auth_token
        headers["Auth-Token"]
    end

    def headers
        request.headers
    end

    def decoded_payload
        JsonWebToken::Base.decode(auth_token)
    end
end
