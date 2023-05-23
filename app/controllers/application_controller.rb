class ApplicationController < ActionController::Base

    private
        #Checking If the user is Logged In or Not
        def require_login
            unless current_user
                session[:intended_url] = request.url
                redirect_to login_path, alert: "Please Log In First!"
            end
        end        
        
        #Current User is saved in "session"
        def current_user
            User.find(session[:user_id]) if session[:user_id]
        end
        helper_method :current_user

        #Giving Particular User controls
        def current_user?(user)
            current_user == user
        end
        helper_method :current_user?       


        #checking if the user is Admin or Not 
        def require_admin?
            unless current_user_admin?
                redirect_to user_url, alert: "Unauthorized Access for Admin"
            end
        end
        helper_method :require_admin?

        def current_user_admin?
            current_user && current_user.admin?
        end
        helper_method :current_user_admin?


        #checking if the user is Customer or Not 
        def require_customer?
            unless current_user_customer?
                redirect_to user_url, alert: "Unauthorized Access for Customer"
            end
        end
        helper_method :require_customer?

        def current_user_customer?
            current_user && current_user.role=="Customer"
        end
        helper_method :current_user_customer?

        
        #checking if the user is Technician or Not 
        def require_technician?
            unless current_user_technician?
                redirect_to user_url, alert: "Unauthorized Access for Technician"
            end
        end
        helper_method :require_technician?

        def current_user_technician?
            current_user && current_user.role=="Technician"
        end
        helper_method :current_user_technician?
end