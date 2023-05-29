class UsersController < ApplicationController
    before_action :authenticate_user!
    after_action :verify_authorized

    def index
        @user = User.all
        authorize User
    end

    def show
        @user = User.find(params[:id])
        authorize @user
    end

    def destroy
        user = User.find(params[:id])
        authorize user
        user.destroy
        redirect_to user_path, :notice => "User Deleted"
    end

    def update
        @user = User.find(params[:id])
        authorize @user

        if @user.update_attributes(secure_params)
            redirect_to users_path, :success => "User Updated"
        else
            redirect_to users_path, :alert => "Unable to to update user"
        end
    end

        private

        def secure_params
            params.require(:user).permit(:role)
        end


end
