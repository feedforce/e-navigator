class UsersController < ApplicationController
    def index
        if current_user != nil
            @users = User.where.not(id: current_user.id)
        end
    end

    def show
        @user = current_user
        redirect_to(user_interviews_path(@user))
    end
end
