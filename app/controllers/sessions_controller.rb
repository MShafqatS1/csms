class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if current_user_admin?
                redirect_to (session[:intended_url] || user), notice: "Woohoo, Welcome Back #{user.name}"
            elsif current_user_technician?
                redirect_to user, notice: "Woohoo, Welcome Back #{user.name}"
            elsif current_user_customer?
                redirect_to user, notice: "Woohoo, Welcome Back #{user.name}"
            else
                redirect_to logout_path, notice: "Oops, Something went Wrong! Please try again after Sometime..."
            end
            session[:intended_url] = nil
        else
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Thanks, We hope that the rest of your day gets better"
    end
end
