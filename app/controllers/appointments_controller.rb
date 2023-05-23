class AppointmentsController < ApplicationController

    before_action :selectapp, only: [:edit, :update, :destroy]
    before_action :require_login

    def index
        @techupcomingapp = Appointment.techupcomingapp
    end
    def new
        @newapp = Appointment.new
    end

    def create
        @newapp = Appointment.new(app_params)
        if @newapp.save
            redirect_to users_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        @updateapp.update(app_params)
        redirect_to users_path
    end
    
    def destroy 
    end

    private
        def selectapp
            @updateapp = Appointment.find(params[:id])
        end

        def app_params
            params.require(:appointment).permit(:user_id, :appdate, :location, :techname)
        end
end